'use strict';
const shim = require('fabric-shim');

let Chaincode = class {
    async Init(stub) {
        return shim.success();
    }

    async Invoke(stub) {
        let ret = stub.getFunctionAndParameters();
        let method = this[ret.fcn];
        try {
            let payload = await method(stub, ret.params);
            return shim.success(payload);
        } catch (err) {
            console.log(err);
            return shim.error(err);
        }
    }

    async put(stub, args) {
        let key = args[0];
        let value = args[1];
        await stub.putState(key, Buffer.from(value));
    }

    async get(stub, args) {
        let key = args[0];
        let value = await stub.getState(key);
        return value;
    }
};

shim.start(new Chaincode());
