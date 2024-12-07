// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .



document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('[data-clipboard]').forEach(button => {
      button.addEventListener('click', (event) => {
        event.preventDefault();
        const text = button.dataset.clipboard;
        navigator.clipboard.writeText(text)
          .then(() => {
            alert('メールアドレスがコピーされました: ' + text);
          })
          .catch(err => {
            console.error('コピーに失敗しました:', err);
          });
      });
    });
  });
  