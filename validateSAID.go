package main
import (
	"strings"
	"fmt"
	"strconv"
)
func check(id string) int {

	id = strings.Replace(id, " ","", -1)
	fmt.Println(id)
	if _ , err := strconv.Atoi(id); err != nil{
		fmt.Println("It's not a number")
		return -1
	}
	if len(id) != 10{
		fmt.Println("Length is not equal to 10")
		return -1
	}
	idtype, _ := strconv.Atoi(id[0:1])

	if idtype != 1 && idtype != 2 {
		fmt.Println("It's not a valid first index")
		return -1
	}

	// Ain't nobody got time for dat, let's make an array!
	idarr := make([]int, len(id))
	for c := 0; c < 10; c++ {
		idarr[c], _ = strconv.Atoi(id[c:c+1])
	}

	sum := 0

	//Where the real business comes in
	// TODO: look like it needs some work on the logic
	for c := 0; c < 10; c++ {
		if c % 2 == 0{
			ZF0dd := string(idarr[c] * 2)
			// A work around cuz again ain't nobody got time for dat
			fvalue,_ := strconv.Atoi(ZF0dd[0:1])
			svalue, _:= strconv.Atoi(ZF0dd[1:1])
			sum += fvalue + svalue

		}else{
			sum += idarr[c]
		}
	}

if sum % 10 !=0 {
	fmt.Println("NOPE")
	return -1
}

	return idtype
}

func main(){
	check("1000000000")
}
