-include .env

all: test

test: build
	cargo test

debug: build
	RUST_BACKTRACE=full cargo test

build:
	stellar contract build
	@ls -l ../../target/wasm32v1-none/release/*.wasm

fmt:
	cargo fmt --all

clean:
	cargo clean

upload:  
stellar contract upload `                 
>>   --wasm C:\Users\brend\Documents\PROJECTS\stellar-impact-bootcamp\youtube\week-2\module-8\todo-list\target\wasm32v1-none\release\todo_list.wasm `
>>   --network testnet `
>>   --source-account brenda

deploy:
stellar contract deploy `
  --wasm-hash ab53f852ea0f3bfe4405035d06c940a4a70824f7d89fb1cacd6e306eb838f45d `
  --network testnet `
  --source-account brenda

interact: 
	stellar contract invoke \
  --id ${CONTRACT_ADDRESS} \
  --source ${SOURCE_TESTNET} \
	--network ${TESTNET} \
  -- \
  get_todos \
   example:
    stellar contract invoke `
  --id CCIDZI2JWX56DSD32A4BSTT23EFITCYMKWHTDDRH7BQVIL3HA3EXCWSH `
  --source-account brenda `
  --network testnet `
  -- `
  get_todos
  example 2:
  stellar contract invoke `
  --id CCIDZI2JWX56DSD32A4BSTT23EFITCYMKWHTDDRH7BQVIL3HA3EXCWSH `
  --source-account brenda `
  --network testnet `
  -- `
  create_todo `
  --title "RPC" `
  --description "Learning Stellar RPC"

list:
	stellar network ls --long

default:
	stellar network use mainnet-ankr

show:
	stellar keys show 

address:
	stellar keys address 

log:
	cat upload.log
get key for account:
stellar keys address brenda
to update the to do:
stellar contract invoke `
  --id CCIDZI2JWX56DSD32A4BSTT23EFITCYMKWHTDDRH7BQVIL3HA3EXCWSH `
  --source-account brenda `
  --network testnet `
  -- `
  update_todo `
  --id 1 `
  --new_title "Updated Task" `
  --new_description "I updated the second Task"

  to delete todolist :
  stellar contract invoke `
  --id CCIDZI2JWX56DSD32A4BSTT23EFITCYMKWHTDDRH7BQVIL3HA3EXCWSH `
  --source-account brenda `
  --network testnet `
  -- `
  delete_todo `
  --id 1