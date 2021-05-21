import Principal "mo:base/Principal";
import Result "mo:base/Result";

actor{
    let LEDGERID : Principal = "ryjl3-tyaaa-aaaaa-aaaba-cai";
    type SubAccount = Blob;
    type CanisterId = Principal;
    type ICPTs = {
      e8s : Nat64;
    }
    type Memo = Nat64;
    type BlockHeight = Nat64;
    type TransactionNotification = {
        from : Principal,
        from_subaccount : ?SubAccount,
        to : CanisterId,
        to_subaccount: ?SubAccount,
        block_height: BlockHeight,
        amount: ICPTs,
        memo: Memo,
    }
    public shared(msg) func transaction_notification(tn : TransactionNotification) : async Result.Result<Blob, String> {
      if (Principal.equal(msg.caller, LEDGERID)) {
        #ok(Principal.toBlob(msg.caller));
      } else {
        #err("Caller not ledger canister");
      }
    };
};
