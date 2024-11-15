import os
import zipfile
import numpy as np
import matplotlib.pyplot as plt
import streamlit as st
import tensorflow as tf
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.utils import load_img, img_to_array

# Unzip Dataset
zip_ref = zipfile.ZipFile('D:/Andre Files/Project Andre/SampahKu/Dataset.zip', 'r')
zip_ref.extractall("tmp/")
zip_ref.close()

# Set up directories
base_dir = 'tmp/DATASET'
train_dir = os.path.join(base_dir, 'TRAIN')
test_dir = os.path.join(base_dir, 'TEST')

# Image Data Generator
base_datagen = ImageDataGenerator(rescale=1./255., horizontal_flip=True)

train_generator = base_datagen.flow_from_directory(
    train_dir,
    target_size=(150, 150),
    batch_size=32,
    class_mode='binary',
    shuffle=True,
    seed=42,
    subset='training'
)

test_generator = base_datagen.flow_from_directory(
    test_dir,
    target_size=(150, 150),
    batch_size=32,
    class_mode='binary',
    shuffle=True,
    seed=42,
    subset='validation'
)

# Build the model
model = tf.keras.models.Sequential([
    tf.keras.layers.Conv2D(32, (3, 3), activation='relu', input_shape=(150, 150, 3)),
    tf.keras.layers.MaxPooling2D(2, 2),
    tf.keras.layers.Conv2D(64, (3, 3), activation='relu'),
    tf.keras.layers.MaxPooling2D(2, 2),
    tf.keras.layers.Conv2D(128, (3, 3), activation='relu'),
    tf.keras.layers.MaxPooling2D(2, 2),
    tf.keras.layers.Conv2D(256, (3, 3), activation='relu'),
    tf.keras.layers.MaxPooling2D(2, 2),
    tf.keras.layers.Conv2D(512, (3, 3), activation='relu'),
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dense(128, activation='relu'),
    tf.keras.layers.Dense(1, activation='sigmoid')
])

model.compile(
    loss=tf.keras.losses.BinaryCrossentropy(),
    optimizer=tf.keras.optimizers.Adam(),
    metrics=['accuracy']
)

# Load model weights if previously saved
# model.load_weights('model_weights.h5')  # Uncomment if you have saved weights

# Streamlit app layout
st.title('SampahKu App')
st.write('Upload an image of waste to classify as Organic or Anorganic.')

# Expander for explanation about Organic and Anorganic waste
with st.expander("Pengertian Sampah Organik dan Anorganik"):
    st.write("""
    **Sampah Organik** adalah sampah yang berasal dari sisa-sisa makhluk hidup, seperti daun, kulit buah, sayuran, dan sisa makanan. Sampah ini mudah terurai oleh mikroorganisme dan dapat diolah menjadi kompos.

    **Sampah Anorganik** adalah sampah yang berasal dari bahan-bahan non-hayati atau buatan manusia, seperti plastik, kaleng, kaca, dan logam. Sampah ini tidak mudah terurai secara alami dan sering kali harus didaur ulang untuk mengurangi dampak lingkungan.
    """)

uploaded_file = st.file_uploader("Choose an image...", type=["jpg", "jpeg", "png"])

if uploaded_file is not None:
    # Display the image
    img = load_img(uploaded_file, target_size=(150, 150))
    st.image(img, caption='Uploaded Image', use_column_width=True)
    st.write("Classifying...")

    # Prepare the image for prediction
    x = img_to_array(img)
    x = np.expand_dims(x, axis=0)
    x = x / 255.0  # Rescale the image

    # Make prediction
    classes = model.predict(x)
    probability = classes[0][0]

    # Display prediction result
    if probability > 0.5:
        st.write("Prediction: Anorganik")
        st.write(f"Probability of Anorganik: {probability:.2f}")
    else:
        st.write("Prediction: Organik")
        st.write(f"Probability of Organik: {1 - probability:.2f}")

# Optional: Plot accuracy and loss graphs if training history is available
# if 'history' in locals():
#     acc = history.history['accuracy']
#     val_acc = history.history['val_accuracy']
#     loss = history.history['loss']
#     val_loss = history.history['val_loss']

#     fig, (acc_fig, loss_fig) = plt.subplots(1, 2, figsize=(17, 5))
#     acc_fig.plot(acc, label='Training accuracy')
#     acc_fig.plot(val_acc, label='Validation accuracy')
#     acc_fig.set_title('Training and validation accuracy')
#     acc_fig.legend(loc="lower right")

#     loss_fig.plot(loss, label='Training loss')
#     loss_fig.plot(val_loss, label='Validation loss')
#     loss_fig.set_title('Training and validation loss')
#     loss_fig.legend(loc="upper right")

#     st.pyplot(fig)

