function test()
{
    var form = document.things_todo_entry_form;
   
    var temp;
    var count=0;
    var name=form.name.value.trim();
    var add=form.add.value.trim();
    var cno=form.cno.value.trim();
    var id=form.id.value.trim();
    
    var namelength=name.length;
    var addlength=add.length;
    var cnolength=cno.length;
    var idlength=id.length;
    
    var only_alpha= new RegExp("[A-z]"); 
    var only_numeric= new RegExp("[0-9|+]"); 
   if(idlength==3)
    {
      for(i=0;i<idlength;i++)
          {

                temp=id.charAt(i);
                if(!only_alpha.test(temp))
                {
                alert("ID OF THINGS TO DO FIELD CAN ONLY CONTAIN ALPHABETS");
                return false;
                }
          }
    }
    else
    {
            
        alert("ID OF THINGS TO DO SHOULD AT LEAST CONTAIN THREE ALPHABETS");
        return false;

    }
     if(namelength>9)
    {
      for(i=0;i<namelength;i++)
          {

                temp=name.charAt(i);
                if(!only_alpha.test(temp))
                {
                alert("NAME OF THINGS TO DO FIELD CAN ONLY CONTAIN ALPHABETS");
                return false;
                }
          }
    }
    else
    {
            
        alert("NAME OF THINGS TO DO SHOULD AT LEAST CONTAIN TEN ALPHABETS");
        return false;

    }

  
   if(addlength>0)
   {
    if(addlength>19)
       {

         for(i=0;i<addlength;i++)
          {
            temp=add.charAt(i);   
            if(only_alpha.test(temp))
            {
               count++; 
            }
        }
            if(count<10)
                {
               alert("ADDRESS OF THINGS TO DO SHOULD AT LEAST CONTAIN TEN ALPHABETS");
               return false;
                }
          
       }else
       {
            alert("ADDRESS OF THINGS TO DO SHOULD AT LEAST CONTAIN TWENTY CHARACTERS");
            return false;
       }
       
   }
   
   if(cnolength>0)
   {
       if(cnolength>=8)
       {

         for(i=0;i<cnolength;i++)
          {

                temp=cno.charAt(i);
                if(!only_numeric.test(temp))
                {
               alert("CONTACT NO OF THINGS TO DO CAN ONLY CONTAIN NUMBERS");
               return false;
                }
          }
       }else
       {
            alert("CONTACT NO OF THINGS TO DO SHOULD AT LEAST CONTAIN EIGHT NUMBERS");
           return false;
       }

   }

         return true;
    }


