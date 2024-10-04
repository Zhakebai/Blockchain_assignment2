// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract AIModelMarketplace {
    struct Model {
        string name;
        string description;
        uint256 price;
        address payable creator;
        uint8 ratingCount;
        uint256 totalRating;
        bool sold;  // Track whether the model has been sold
    }

    Model[] public models;
    mapping(address => uint256) public creatorBalances;

    event ModelListed(uint256 modelId, string name, uint256 price, address creator);
    event ModelPurchased(uint256 modelId, address buyer, uint256 price);
    event ModelRated(uint256 modelId, uint8 rating, address rater);
    event FundsWithdrawn(address creator, uint256 amount);

    // List a new AI model
    function listModel(string memory name, string memory description, uint256 price) public {
        require(price > 0, "Price must be greater than 0");

        models.push(Model({
            name: name,
            description: description,
            price: price,
            creator: payable(msg.sender),
            ratingCount: 0,
            totalRating: 0,
            sold: false  // Initialize as not sold
        }));

        emit ModelListed(models.length - 1, name, price, msg.sender);
    }

    // Purchase a model by ID
    function purchaseModel(uint256 modelId) public payable {
        require(modelId < models.length, "Invalid model ID");
        Model storage model = models[modelId];
        require(msg.value >= model.price, "Insufficient payment");
        require(!model.sold, "Model has already been sold");

        // Mark as sold
        model.sold = true;

        // Transfer funds to the model's creator
        creatorBalances[model.creator] += msg.value;

        emit ModelPurchased(modelId, msg.sender, model.price);
    }

    // Rate a purchased model
    function rateModel(uint256 modelId, uint8 rating) public {
        require(modelId < models.length, "Invalid model ID");
        require(rating > 0 && rating <= 5, "Rating must be between 1 and 5");

        Model storage model = models[modelId];
        model.ratingCount++;
        model.totalRating += rating;

        emit ModelRated(modelId, rating, msg.sender);
    }

    // Withdraw accumulated funds
    function withdrawFunds() public {
        uint256 amount = creatorBalances[msg.sender];
        require(amount > 0, "No funds to withdraw");

        creatorBalances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);

        emit FundsWithdrawn(msg.sender, amount);
    }

    // Get all models (for frontend display)
    function getAllModels() public view returns (Model[] memory) {
        return models;
    }

    // Get model details (returns additional info for frontend display)
    function getModelDetails(uint256 modelId) public view returns (string memory, string memory, uint256, address, uint256, uint8) {
        require(modelId < models.length, "Invalid model ID");
        Model storage model = models[modelId];
        uint256 averageRating = model.ratingCount > 0 ? model.totalRating / model.ratingCount : 0;

        return (model.name, model.description, model.price, model.creator, averageRating, model.ratingCount);
    }

    // Get the total number of models
    function getModelCount() public view returns (uint256) {
        return models.length;
    }
}


