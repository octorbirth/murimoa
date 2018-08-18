function makePage(param){

    var pageSize = param.pageSize || 10; 
    var liCount = param.liCount || 10; 
    var total = param.total || 0; 
    var current = param.current || 1; 

    var tempPageEnd = makeTempPageEnd();
    
    var startPageNum = makeStartPageNum();
    var realPageEnd = makeRealPageEnd(); 

    var prev = startPageNum -1;
    var next = tempPageEnd * pageSize < total ? tempPageEnd + 1 : 0;
    
    
    // [Prev], [Next]는 기본적으로 비활성화(disabled) 해두었다.
    var prevTag = "<li data-page=$$page class='disabled'><a href='#'>Prev</a></li>";
    var nextTag = "<li data-page=$$page class='disabled'><a href='#'>Next</a></li>";
    
    // 중간에 페이지 번호는 일단 모두 활성화(active) 해놓았다.
    var tag = "<li data-page=$$page class='active'><a href='#'>$$pageStr</a></li>";    

    function makeTags(){
    	
        var str = "";
        
        if(prev != 0){ // [Prev] 버튼이 활성화 되어야 한다면
            str += prevTag.replace("disabled","") // 버튼을 활성화 시킨다.
            			.replace("$$page", prev); // 클릭했을 때 해당 페이지로 이동할 수 있도록 값을 할당
        }else{ // 비활성화된 상태에서 data-page 속성을 없앤다.
            str += prevTag.replace("data-page=$$page", '');
        }
        
        for(var i = startPageNum; i <= realPageEnd; i++ ){
            if(current === i){ // 현재 보고 있는 page라면...
                str += tag.replace("$$page", i).replace("$$pageStr", i);
            }else{ // 현재 페이지가 아니라면 비활성화 시킨다.
                str += tag.replace("$$page", i).replace("$$pageStr", i).replace("class='active'", "");
            }
            
        }
        
        // [prev]와 동작원리가 동일하다.
        if(next != 0){
            str += nextTag.replace("disabled","").replace("$$page", next);
        }else{
        	str += nextTag.replace("data-page=$$page", '');
        }
        
        return str;        
    }
    

    //tempPageEnd
    function makeTempPageEnd() {
        return Math.ceil(current/liCount) * liCount;
    }

    //startPageNum
    function makeStartPageNum(){
        return tempPageEnd - (liCount -1);
    }

    //realPageEnd
    function makeRealPageEnd() {
        var lastPage = Math.ceil(total/pageSize);
        return tempPageEnd > lastPage ? lastPage :tempPageEnd;
    }
    
    return makeTags();
}