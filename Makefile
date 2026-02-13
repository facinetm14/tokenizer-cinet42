NAME = PK52

NETWORK = bscTestnet

# Colors
GREEN = \033[0;32m
YELLOW = \033[1;33m
RED = \033[0;31m
RESET = \033[0m

all: build

build:
	@echo "$(YELLOW)Compiling contracts...$(RESET)"
	yarn
	yarn hardhat build
	@echo "$(GREEN)Compilation finished.$(RESET)"

deploy:
	@echo "$(YELLOW)Deploying to $(NETWORK)...$(RESET)"
	yarn hardhat ignition deploy deployment/modules/CinetK42.ts --network $(NETWORK)
	@echo "$(GREEN)Deployment finished.$(RESET)"


launch-node:
	@echo "$(YELLOW)Deploying to $(NETWORK)...$(RESET)"
	yarn hardhat node

deploy-dev:
	@echo "$(YELLOW)Deploying to localhost...$(RESET)"
	yarn hardhat ignition deploy deployment/modules/CinetK42.ts --network localhost
	@echo "$(GREEN)Deployment finished.$(RESET)"

clean:
	@echo "$(RED)Cleaning cache and artifacts...$(RESET)"
	yarn hardhat clean
	rm -rf .ignition
	@echo "$(GREEN)Cleaned.$(RESET)"

fclean: clean
	@echo "$(RED)Removing node_modules...$(RESET)"
	rm -rf node_modules cache
	make clean

re: fclean
	yarn install
	make compile

help:
	@echo "Available commands:"
	@echo "  make build      - Compile smart contracts"
	@echo "  make deploy       - Deploy to BSC Testnet"
	@echo "  make deploy-dev   - Deploy to localhost"
	@echo "  make launch-node  - Launch hardhat node tasks for dev deploy"
	@echo "  make clean        - Remove artifacts and cache"
	@echo "  make fclean       - Full clean (including node_modules)"
	@echo "  make re           - Reinstall and recompile"
