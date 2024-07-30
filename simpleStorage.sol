// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;//最上面写版本号,^是任何比0.8.7新的版本都能使用这段代码

contract simpleStorage{//里面就是合约，类似class
    //boolean,uint,int,address,bytes 数据类型
    uint256 public aaa = 123;//如果不赋值就是0
    address myAddress= 0x597844f10BAd38Ef699BE77b314038F6122B90D9;
    bytes32 myBytes="0x2321321321";//8bits=byte  32是bytes最大空间

    struct People{  //创建一个新类型People
        string name;
        int age;
    }

    mapping (string=>int) public nameToAge; //映射
    People public person = People({name:"cat",age:1});//给people这个类型赋值

    People[] public people; //用people这个类型创建数组

    //函数 做越多的操作消耗越多的gas
    function score (uint256 _aaa) public{
        aaa = _aaa;
        aaa += aaa;
    }

    //如果一个函数是view函数，只读取合约的状态，不改变,不需要gas
    function retrieve() public view returns (uint256){ 
        return aaa;
    }

    //如果一个函数是pure函数，不能读取合约的状态，也不改变合约,不需要gas
    function add() public pure returns (uint256){
        return (1+1);
    }

    //添加people数组的函数
    function addPerson(string memory _name,int _age) public { //memory关键字用于在函数执行期间暂时存储临时变量，仅在函数执行期间存在,calldata关键字用于存储函数参数和返回值，是只读的，不能被修改。
        People memory newPerson=People({name:_name,age:_age});
        people.push(newPerson);
        nameToAge[_name]= _age; //调用映射
    }


}