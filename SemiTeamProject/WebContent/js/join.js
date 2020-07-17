 function idCheck() {
        
        var regex = /[a-z0-9]{8,20}/g;
        var idTag = document.querySelector('input[name=member_id]');
        
        var isCheckId = regex.test(idTag.value);
        

        idTag.classList.remove('correct');
        idTag.classList.remove('incorrect');
        
        if (isCheckId) {
            idTag.classList.add('correct');
            return true;
        }
        else{
            idTag.classList.add('incorrect');
            return false;
        }
    }
        
    function pwCheck() {

        var regex = /(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}/g;
        var pwTag = document.querySelector('input[name=member_pw]');

        var isCheckPw = regex.test(pwTag.value);


        pwTag.classList.remove('correct');
        pwTag.classList.remove('incorrect');

        if (!isCheckPw) {
            pwTag.classList.add('incorrect');
            return false;
        }
        else{
            return true;
        }
    }
        
      function nameCheck() {
        var regex = /[가-힣]{2,7}/g;
    	var nameTag = document.querySelector('input[name=member_name]');
        
    	var isName = regex.test(nameTag.value);
    	
    	nameTag.classList.remove("incorrect");
    	
        if (!isName) {
            nameTag.classList.add('incorrect');
            return false;
        }
        else {
            return true;
        }
        
    }
    
    function birthCheck() {
        
        var regex = /(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])/g;
        var birthTag = document.querySelector('input[name=member_birth]');
        
        var isBirthcheck = regex.test(birthTag.value);
        
        birthTag.classList.remove("incorrect");
        
        if (!isBirthcheck) {
            birthTag.classList.add("incorrect");
            return false;
        }
        else {
            return true;
        }
        
    }
        
    function mailCheck() {
       var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/gi;
        var mailTag = document.querySelector('input[name=member_mail]');
        
        var isMail = regex.test(mailTag.value);
        
        mailTag.classList.remove("incorrect");
        
        if (!isMail) {
        	mailTag.classList.add("incorrect");
            return false;
        }
        else {
            return true;
        }
        
    }
        
    function phoneCheck() {
    	
        var regex = /\d{11}/g;
        var phoneTag = document.querySelector('input[name=member_phone]');
        
        var isPhone = regex.test(phoneTag.value);
	
        phoneTag.classList.remove('incorrect');
        
        if (!isPhone) {
            phoneTag.classList.add('incorrect');
            return true;
        }
        else{
            return false;
        }
        
    }
    
    function companyCheck() {
    	
        var regex = /\d{10}/g;
        var phoneTag = document.querySelector('input[name=member_phone]');
        
        var isPhone = regex.test(phoneTag.value);
	
        phoneTag.classList.remove('incorrect');
        
        if (!isPhone) {
            phoneTag.classList.add('incorrect');
            return true;
        }
        else{
            return false;
        }
        
    }
        
    function memberJoin() {
        
        if(idCheck() && pwCheck() && nameCheck() && birthCheck() && mailCheck() && phoneCheck()) {
            return true;
        }
        else {
            return false;
        }
        
    }

    function sellerJoin() {
        
        if(idCheck() && pwCheck() && nameCheck() && birthCheck() && mailCheck() && phoneCheck() && companyCheck()) {
            return true;
        }
        else {
            return false;
        }
        
    }