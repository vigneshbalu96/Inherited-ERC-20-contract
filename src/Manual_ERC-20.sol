//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract manual_erc20 {
    mapping(address => uint256) private s_balance;

    function name() public pure returns (string memory) {
        return "MyCoin";
    }

    function symbol() public pure returns (string memory) {
        return "Coin";
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return s_balance[_owner];
    }

    function transfer(address _to, uint256 _value) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balance[msg.sender] -= _value;
        s_balance[_to] += _value;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }
}
