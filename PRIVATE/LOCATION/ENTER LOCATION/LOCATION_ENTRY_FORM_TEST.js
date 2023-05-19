function test()
{
    var form = document.location_entry_form;
   
    var temp;
    var name=form.name.value.trim();
    var id=form.id.value.trim();
    
    
    var namelength=name.length;
    var idlength=id.length;
  
    var only_alpha= new RegExp("[A-z]"); 
    var only_alpha_and_space= new RegExp("[A-z\\s]"); 
  if(namelength>2)
   {
 
     for(i=0;i<namelength;i++)
      {
                
            temp=name.charAt(i);
            if(!only_alpha_and_space.test(temp))
            {
           alert("NAME OF LOCATION FIELD CAN ONLY CONTAIN ALPHABETS");
           return false;
            }
      }
   }else
   {
   	alert("NAME OF LOCATION SHOULD AT LEAST CONTAIN THREE ALPHABETS");
       return false;
   }

if(idlength==3)
   {
 
     for(i=0;i<idlength;i++)
      {
                
            temp=id.charAt(i);
            if(!only_alpha.test(temp))
            {
           alert("ID OF LOCATION FIELD CAN ONLY CONTAIN ALPHABETS");
           return false;
            }
      }
   }else
   {
   	alert("ID OF LOCATION MUST CONTAIN THREE ALPHABETS");
        return false;
   }


     return true;
}


