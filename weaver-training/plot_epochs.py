import re
import matplotlib.pyplot as plt

# Read the log file
log_file_path = 'logs/PNet_Hss_SiD_o2_v04_D_4Oct24.log'  # Replace with your log file path
with open(log_file_path, 'r') as file:
    new_file_contents = file.readlines()

# Patterns for detecting relevant parts of the log
start_pattern_new = re.compile(r"Train AvgLoss")
end_pattern_new = re.compile(r"Epoch #\d+: Current validation metric")

performance_blocks_new = []
inside_block_new = False
current_block_new = []

# Extract performance metrics from the log file
for line in new_file_contents:
    if start_pattern_new.search(line):
        inside_block_new = True  # Start of the block
    if inside_block_new:
        current_block_new.append(line)  # Collect lines within the block
    if end_pattern_new.search(line):
        inside_block_new = False  # End of the block
        performance_blocks_new.append(current_block_new)
        current_block_new = []  # Reset for the next block

# Extract numerical values for train loss, accuracy, and validation metric
train_loss_new = []
train_acc_new = []
val_metric_new = []
epochs_new = []

for block in performance_blocks_new:
    for line in block:
        # Extract train loss and accuracy
        if 'Train AvgLoss' in line:
            loss_acc_match = re.findall(r"\d+\.\d+", line)
            if loss_acc_match and len(loss_acc_match) >= 2:
                train_loss_new.append(float(loss_acc_match[0]))
                train_acc_new.append(float(loss_acc_match[1]))
        
        # Extract validation metric
        if 'Current validation metric' in line:
            val_metric_match = re.search(r"Current validation metric: (\d+\.\d+)", line)
            if val_metric_match:
                val_metric_new.append(float(val_metric_match.group(1)))
            
        # Extract epoch number
        if 'Epoch #' in line and 'validating' not in line:
            epoch_match = re.search(r"Epoch #(\d+)", line)
            if epoch_match:
                epochs_new.append(int(epoch_match.group(1)))

# Aligning the lengths of all lists for the new data
min_length_new = min(len(epochs_new), len(train_loss_new), len(val_metric_new), len(train_acc_new))

epochs_new = epochs_new[:min_length_new]
train_loss_new = train_loss_new[:min_length_new]
train_acc_new = train_acc_new[:min_length_new]
val_metric_new = val_metric_new[:min_length_new]

# Plotting the data
fig, axs = plt.subplots(3, 1, figsize=(10, 12))

# Plotting Train Loss
axs[0].plot(epochs_new, train_loss_new, label='Train Loss', marker='o')
axs[0].set_xlabel('Epoch')
axs[0].set_ylabel('Loss')
axs[0].set_title('Train Loss over Epochs')
axs[0].legend()

# Plotting Train Accuracy
axs[1].plot(epochs_new, train_acc_new, label='Train Accuracy', marker='o', color='green')
axs[1].set_xlabel('Epoch')
axs[1].set_ylabel('Accuracy')
axs[1].set_title('Train Accuracy over Epochs')
axs[1].legend()

# Plotting Validation Metric
axs[2].plot(epochs_new, val_metric_new, label='Validation Metric', marker='x', color='red')
axs[2].set_xlabel('Epoch')
axs[2].set_ylabel('Validation Metric')
axs[2].set_title('Validation Metric over Epochs')
axs[2].legend()

plt.tight_layout()

# Display the plots
plt.savefig("SiD_o2_v04_D.pdf")
plt.show()
