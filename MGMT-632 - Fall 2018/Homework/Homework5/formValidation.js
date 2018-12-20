function validateForm()
{
    if (!document.cusInfo.fName.value.match(/^[a-zA-Z\- ]+$/))
    {
        alert('Please enter a valid first name');
        document.cusInfo.fName.focus();
        return;
    }

    if (!document.cusInfo.lName.value.match(/^[a-zA-Z\- ]+$/))
    {
        alert('Please enter a valid last name');
        document.cusInfo.lName.focus();
        return;
    }

    if (!document.cusInfo.userID.value.match(/\w{6,}/))
    {
        alert('Please enter a valid user ID');
        document.cusInfo.userID.focus();
        return;
    }

    if (!document.cusInfo.pw.value.match(/^[A-Za-z\d]{6,12}$/))
    {
        alert('Please enter a valid password');
        document.cusInfo.pw.focus();
        return;
    }

    if (!((document.cusInfo.gender[0].checked) || (document.cusInfo.gender[1].checked)))
    {
        alert('You must select a gender');
        document.cusInfo.gender.focus();
        return;
    }

    if (document.cusInfo.age.value == "0")
    {
        alert('Please select your age');
        document.cusInfo.age.focus();
        return;
    }

    if (document.cusInfo.major.value == "0")
    {
        alert('Please select your major');
        document.cusInfo.major.focus();
        return;
    }

    if (!document.cusInfo.message.value.match(/^.{6,}/))
    {
        alert('Please enter a valid message');
        document.cusInfo.message.focus();
        return;
    }

    //alert('Finished!');
    document.cusInfo.submit();
}