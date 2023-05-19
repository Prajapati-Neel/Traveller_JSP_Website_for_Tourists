function test()
{
    var form = document.state_entry_form;
   
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
           alert("NAME OF STATE FIELD CAN ONLY CONTAIN ALPHABETS");
           return false;
            }
      }
   }else
   {
   	alert("NAME OF STATE SHOULD AT LEAST CONTAIN THREE ALPHABETS");
       return false;
   }

if(idlength==2)
   {
 
     for(i=0;i<idlength;i++)
      {
                
            temp=id.charAt(i);
            if(!only_alpha.test(temp))
            {
           alert("ID OF STATE FIELD CAN ONLY CONTAIN ALPHABETS");
           return false;
            }
      }
   }else
   {
   	alert("ID OF STATE MUST CONTAIN TWO ALPHABETS");
       return false;
   }

   


     return true;
}

