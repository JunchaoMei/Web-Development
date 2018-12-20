<%
' ::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::
' **************************************************************************************
' * validateProduct                                                                    *
' *    This function will validate the form fields for adding and updating products    *
' **************************************************************************************

    Function validateProduct()
        'initialize
        strError="N"
        strValidationChecks=""
        Dim objRegExp
        Set objRegExp = New RegExp
        objRegExp.IgnoreCase = True

        'prodID
        objRegExp.Pattern = "[^0-9]"
        If objRegExp.Test(strProdID) Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "prodID must be a number" & "<br><br>"
        Elseif len(strProdID)<5 Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "prodID must be 5 digits or larger" & "<br><br>"
        End If

        'prodName
        If len(strProdName)<5 Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "prodName must be 5 characters or more" & "<br><br>"
        Elseif len(strProdName)>100 Then
            strProdName = Left(strProdName, 100)
            strProdName = Replace(strProdName, "'", "''")
            strValidationChecks = strValidationChecks & "prodName has been truncated to 100 characters" & "<br><br>"
        End If

        'headline
        If len(strHeadline)<10 Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "headline must be 10 characters or more" & "<br><br>"
        Elseif len(strHeadline)>200 Then
            strHeadline = Left(strHeadline, 200)
            strHeadline = Replace(strHeadline, "'", "''")
            strValidationChecks = strValidationChecks & "headline has been truncated to 200 characters" & "<br><br>"
        End If

        'desc
        If len(strDesc)<20 Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "desc must be 20 characters or more" & "<br><br>"
        Elseif len(strDesc)>1000 Then
            strDesc = Left(strDesc, 1000)
            strDesc = Replace(strDesc, "'", "''")
            strValidationChecks = strValidationChecks & "desc has been truncated to 1000 characters" & "<br><br>"
        End If

        'rPrice
        If len(strRPrice)=0 Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "rPrice must not be empty" & "<br><br>"
        Elseif Not IsNumeric(strRPrice) Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "rPrice must be a number" & "<br><br>"
        Elseif strRPrice<1 Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "rPrice must be greater than 1 dollar" & "<br><br>"
        Else
            strRPrice = Round(strRPrice*100)/100
        End If

        'sPrice
        If len(strSPrice)=0 Then
            strSPrice = strRPrice
        End If
        If Not IsNumeric(strSPrice) Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "sPrice must be a number" & "<br><br>"
        Elseif strSPrice<1 Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "sPrice must be greater than 1 dollar" & "<br><br>"
        Elseif Csng(strSPrice)>Csng(strRPrice) Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "sPrice must be less than rPrice" & "<br><br>"
        Else
            strSPrice = Round(strSPrice*100)/100
        End If

        'catID
        If strCatID=0 Then
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "department and category must be selected" & "<br><br>"
        End If

        'tImage
        If len(strTImage)=0 Then
            strTImage = "images/products/thumbs/noPic.jpg"
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "strTImage is empty" & "<br><br>"
        End If

        'nImage
        If len(strNImage)=0 Then
            strNImage = "images/products/normal/noPic.jpg"
            strErrors = "Y"
            strValidationChecks = strValidationChecks & "strNImage is empty" & "<br><br>"
        End If

        'keywords
        strKeywords = Left(strKeywords,100)
        strKeywords = Replace(strKeywords, "'", "''")
        
        'finalize
        If strErrors="Y" Then
            strErrorMessage=strValidationChecks
            strIsErrors="Y"
        End If

    End Function


' ::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::..::
' **************************************************************************************
' * checkProdID                                                                        *
' *    This function will check if a prodID already exists when adding new products    *
' **************************************************************************************

    Function checkProdID()
        If strProdID="" Then
            validateProdID=0
        Else
            validateProdID=strProdID
        End If

        SQLcheckProdID = "select count(*) as 'Total' from product where prodID = " & validateProdID
        Set RScheckProdID = conn.Execute(SQLcheckProdID)

        If RScheckProdID("Total")>0 Then
            strErrorMessage = "The Product ID entered already exists <br><br>" & strErrorMessage
            strIsErrors="Y"
        End If

        RScheckProdID.close
    End Function

%>
