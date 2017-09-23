;(function ($,window,document,undefined) {
	// 构造函数
	var TwoFilter=function(ele,opt){
		this.$element=ele,
		this.defaults={
			'arr1':[],//第一次筛选后的值
			'arr2':[],//第二次筛选后的值
			'Id_Arr1':'#selStu',
        	'Id_Arr2':'#seledStu'
		},
		this.options=$.extend({},this.defaults,opt)
	}
	//定义方法
	TwoFilter.prototype={
		//显示第一次筛选的值
		showArr1:function(){
				var myarr=this.options.arr1;
				var $sel=this.options.Id_Arr1;
			    var selStuhtml = ''; //拼接的Html
				$.each(myarr,function(){
					selStuhtml+='<label class="itemsel">'+
                   		'<input name="stu" type="checkbox" value="'+this.code+'" /><span>'+this.name+'</span> </label>';	
				});
				$($sel).html(selStuhtml);
		},
		//显示第二次筛选的值
		showArr2:function(){
				var myarr=this.options.arr2;
				var $sel=this.options.Id_Arr2;
			    var selStuhtml = ''; //拼接的Html
				$.each(myarr,function(){
					selStuhtml+='<div id="'+this.code+'" class="itemseled"><span>'+this.name+
					'</span><span class="close" onclick="delStu(this)"></span></div>'
				});
				$($sel).html(selStuhtml);
		},
		//第一筛选框添加到第二筛选框
		Arr1ToArr2:function(){
				var selStuhtml = ''; //拼接的Html
				var $sel=this.options.Id_Arr2;
	            //添加先判断是否已经有了
	            var showboxStu = []; //seledBox 中已经有的学生
	            $.each($('.itemseled'), function() {
	                showboxStu.push(this.id.toString());
	            })
	            //意思是选择被选中的checkbox
	            $.each($('input:checkbox:checked'), function() {
	                var stuNum = $(this).val().toString();
	                var stuName = $(this).next().text();
	                var $domDiv=$(this).closest('.itemsel');//获取最近父元素
	                if ($.inArray(stuNum, showboxStu) == -1) {
	                	//删除已经添加了的学生
	                	$domDiv.remove();
	                    selStuhtml += getSelStu(stuNum, stuName);
	                }
	            });
	            //把选中的学生放入box
	            $($sel).append(selStuhtml);
		},
		//获取第二次筛选的值
		getaArr2:function(){
				var showboxStu = []; //seledBox 中已经有的学生
				$.each($('.itemseled'), function() {
	                showboxStu.push(this.id.toString());
	            })
	            return showboxStu;
		}
	}
	//插件初始化
	$.fn.twoFilterPlugin=function(options){
		//创建实体
		var twoFilter=new TwoFilter(this,options);
		//调用方法
		return twoFilter;
	}

	//************************工具函数
	//获取选择的学生的HTML（左）
	function getSelStu(stuNum, stuName) {
	    var htmlstr = '<div id="' + stuNum + '" class="itemseled"><span>' + stuName + '</span><span class="close" onclick="delStu(this)"></span></div>'
	    return htmlstr;
	}
})(jQuery,window,document);