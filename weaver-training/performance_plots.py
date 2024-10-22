import torch
import os
import matplotlib.pyplot as plt


# Function to load the model from a given checkpoint file
def load_model(checkpoint_path, model):
    checkpoint = torch.load(checkpoint_path)
    model.load_state_dict(checkpoint['model_state_dict'])
    return model

# Function to evaluate model performance on a dataset (validation or test)
def evaluate_model(model, dataloader, criterion, device):
    model.eval()  # Set model to evaluation mode
    running_loss = 0.0
    correct = 0
    total = 0
    
    with torch.no_grad():
        for inputs, labels in dataloader:
            inputs, labels = inputs.to(device), labels.to(device)
            
            # Forward pass
            outputs = model(inputs)
            loss = criterion(outputs, labels)
            
            # Track loss
            running_loss += loss.item() * inputs.size(0)
            
            # Track accuracy (assuming classification task)
            _, predicted = torch.max(outputs, 1)
            total += labels.size(0)
            correct += (predicted == labels).sum().item()
    
    # Calculate average loss and accuracy
    avg_loss = running_loss / total
    accuracy = correct / total
    return avg_loss, accuracy

import os

# Assuming you have a list of .pt files, one for each epoch
checkpoint_dir = "path_to_checkpoints/"
checkpoint_files = sorted([f for f in os.listdir(checkpoint_dir) if f.endswith(".pt")])

# Initialize lists to store results
val_losses = []
val_accuracies = []
test_losses = []
test_accuracies = []

# Loop through each checkpoint file
for checkpoint_file in checkpoint_files:
    model = YourModelClass()  # Initialize the model
    model = load_model(os.path.join(checkpoint_dir, checkpoint_file), model)
    model = model.to(device)  # Move to GPU/CPU as needed
    
    # Evaluate on validation set
    val_loss, val_accuracy = evaluate_model(model, val_dataloader, criterion, device)
    val_losses.append(val_loss)
    val_accuracies.append(val_accuracy)
    
    # Evaluate on test set
    test_loss, test_accuracy = evaluate_model(model, test_dataloader, criterion, device)
    test_losses.append(test_loss)
    test_accuracies.append(test_accuracy)

# Now val_losses, val_accuracies, test_losses, and test_accuracies contain performance metrics for each epoch

# Plot Validation Loss and Accuracy
plt.figure()
plt.plot(val_losses, label="Validation Loss")
plt.plot(val_accuracies, label="Validation Accuracy")
plt.xlabel("Epoch")
plt.ylabel("Performance")
plt.title("Validation Loss and Accuracy Over Epochs")
plt.legend()
plt.show()

# Plot Test Loss and Accuracy
plt.figure()
plt.plot(test_losses, label="Test Loss")
plt.plot(test_accuracies, label="Test Accuracy")
plt.xlabel("Epoch")
plt.ylabel("Performance")
plt.title("Test Loss and Accuracy Over Epochs")
plt.legend()
plt.show()
