function test()
{
    var form = document.cuisines_entry_form;
    var cuisine=form.cuisine.value.trim();
    var cuisinelength=cuisine.length;
    var only_alpha= new RegExp("[A-z]"); 
 if(cuisinelength>3)
    {
      for(i=0;i<cuisinelength;i++)
          {

                temp=cuisine.charAt(i);
                if(!only_alpha.test(temp))
                {
                alert("CUISINE FIELD CAN ONLY CONTAIN ALPHABETS");
                return false;
                }
          }
    }
    else
    {
            
        alert("CUISINE SHOULD AT LEAST CONTAIN FOUR ALPHABETS");
        return false;

    }
}