const Cars = artifacts.require("Cars");



contract("Cars", async function(accounts){

    it(
        "should add a car", async function(){
            // let carId = 1; 9000000000000000000
            let instance = await Cars.deployed()
            await instance.addCar("BNZ", 2020, web3.utils.toWei('7', 'ether'), {from: accounts[0]});
    });

    it(
        "is for sale", async function(){
            // let carId = 1; 9000000000000000000
            let instance = await Cars.deployed()
            await instance.addCar("BNZ", 2020, web3.utils.toWei('7', 'ether'), {from: accounts[0]});
            let getCar = await instance.fatch(1);
            assert(getCar.status === true, "Error: the car wasn't setup for sale");
    });

    // it(
    //     "Try to sell the car but user2 does not offer enough money", async function(){
    //         let user1 = accounts[0];
    //         let user2 = accounts[1];
    //         let price = web3.utils.toWei('7', 'ether');
    //         let user2Price = 3000000000000000000;
    //         let instance = await Cars.deployed()
    //         await instance.addCar("BNZ", 2020,price , {from: user1});
    //         // let balanceBefor = web3.eth.getBalance(user1);
    //         assert.equal(user2Price === price , "The price is not enough!");
    //         await instance.payment(1, {from: user2, value: user2Price });
    //         // let getCar = await instance.fatch(1);
    //         // assert(getCar.status === true , "Error: the car wasn't setup for sale");
    //         // assert(getCar.amount.toNumber() === price , "The price is not enough!");

    // });

    it(
        "Sold the car to user2", async function(){
            let user1 = accounts[0];
            let user2 = accounts[1];
            let price = web3.utils.toWei('7', 'ether');
            let instance = await Cars.deployed()
            await instance.addCar("BNZ", 2020,price , {from: user1});
            // let balanceBefor = web3.eth.getBalance(user1);
            let getCar = await instance.fatch(1); // here an error will occur on line 75
            assert.equal(getCar.buyer , user2 );
            // assert(getCar.status === true , "Error: the car wasn't setup for sale");
            await instance.payment(1, {from: user2, value: price});
        
            // let getCar = await instance.fatch(1);
            // assert.equal(getCar.buyer , user2 );

            // assert.equal(balanceBefor - price, web3.eth.getBalance(user1));

    });




});