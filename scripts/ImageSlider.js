

    
    function fun() {
        i++;
        document.getElementById("img1").src = "Images/" + i + ".png";
        if (i == 2) //here 2 is number of images i want to display in the slide show
        { i = 0; }

        return; 
    }
    

