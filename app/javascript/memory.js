document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('memory-image')){
    const ImageLists = document.getElementById('image-lists');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'images')

      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `memory_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'memory[images][]')
      inputHTML.setAttribute('type', 'file')

      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML);
      ImageLists.appendChild(imageElement);

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      });
    };

    document.getElementById('memory-image').addEventListener('change', function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});