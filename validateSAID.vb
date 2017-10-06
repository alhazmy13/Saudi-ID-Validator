' Dont forget to import System.Text.RegularExpressions
Public Function check(id As String) As Integer
	id = id.Trim()
	If Not Regex.IsMatch(id, "[0-9]+") Then
		Return -1
	End If
	If id.Length <> 10 Then
		Return -1
	End If
	Dim type As Integer = Integer.Parse(id.Chars(0))
	If type <> 2 AndAlso type <> 1 Then
		Return -1
	End If
	Dim sum As Integer = 0
	For i As Integer = 0 To 9
		If i Mod 2 = 0 Then
			Dim ZFOdd As String = (Integer.Parse(id.Chars(i)) * 2).ToString().PadLeft(2, "0")
			sum += Integer.Parse(ZFOdd.Chars(0)) + Integer.Parse(ZFOdd.Chars(1))
		Else
			sum += Integer.Parse(id.Chars(i))
		End If
	Next
	Return If((sum Mod 10 <> 0), -1, type)
	
End Function
