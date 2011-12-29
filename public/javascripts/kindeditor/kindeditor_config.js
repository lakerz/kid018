KE.show({
    id : 'kindeditor',
    width : "80%",
    height : "400px",
    allowFileManager : false,
    imageUploadJson:'/kindeditor/upload',
    items : [
		'fullscreen', 'undo', 'redo', 'cut', 'copy', 'paste',
		'|', 'justifyleft', 'justifycenter', 'justifyright',
		'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent','|',
		 'fontsize', 'textcolor', 'bgcolor', 'bold',
		'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',
		'flash', 'advtable', 'hr', 'emoticons', 'link', 'unlink'
	]
});
