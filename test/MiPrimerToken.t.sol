// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { Test } from "forge-std/Test.sol";
import "../src/MiPrimerToken.sol";

contract MiPrimerTokenTest is Test {
    MiPrimerToken token;

    address owner = address(0x1);
    address user = address(0x2);

    uint256 constant INITIAL_SUPPLY = 1_000_000 * 10 ** 18;

    function setUp() public {
        vm.prank(owner);
        token = new MiPrimerToken();
    }

    function test_OwnerIsCorrect() public view {
        assertEq(token.owner(), owner);
    }

    function test_NameAndSymbol() public view {
        assertEq(token.name(), "MiPrimerToken");
        assertEq(token.symbol(), "MPT");
    }

    function test_InitialSupplyMintedToDeployer() public view {
        assertEq(token.totalSupply(), INITIAL_SUPPLY);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY);
    }

    function test_TransferTokens() public {
        uint256 amount = 1_000 * 10 ** 18;

        vm.prank(owner);
        bool ok = token.transfer(user, amount);
        assertTrue(ok, "transfer returned false");

        assertEq(token.balanceOf(user), amount);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY - amount);
    }

    function test_RevertIf_TransferMoreThanBalance() public {
        vm.prank(user);
        vm.expectRevert();
        bool ok = token.transfer(owner, 1 * 10 ** 18);
        assertTrue(!ok || token.balanceOf(user) < 1 * 10 ** 18);
    }

    function test_TransferOwnership() public {
        vm.prank(owner);
        token.transferOwnership(user);

        assertEq(token.owner(), user);
    }

    function test_RevertIfNonOwnerTransfersOwnership() public {
        vm.prank(user);
        vm.expectRevert();
        token.transferOwnership(user);
    }
}