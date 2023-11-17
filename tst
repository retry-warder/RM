package main

import (
 "encoding/json"
 "fmt"
)

func main() {

 type myStruct struct {
  OneField string
  TwoField int
 }

 var sliceMyStruct []myStruct

 sliceMyStruct = append(sliceMyStruct, myStruct{"one", 1}, myStruct{"two", 2})

 b, err := json.Marshal(sliceMyStruct)

 if err != nil {
  panic(err)
 }

 fmt.Println(string(b))

 var newSliceMyStruct []myStruct

 err = json.Unmarshal(b, &newSliceMyStruct)

 if err != nil {
  panic(err)
 }

 fmt.Println(fmt.Sprintf("%v", newSliceMyStruct))
}

func (d *Data) UnmarshalJSON(b []byte) error {
    type data Data
    tmp := &data{bar: "bar"}
    err := json.Unmarshal(b, tmp)
    if err != nil {
        return err
    }
    *d = Data(*tmp)
    return nil
}

