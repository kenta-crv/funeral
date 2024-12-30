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
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .

// 確認用のログを追加
console.log("jQuery and Bootstrap loaded");



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
  
  document.addEventListener("DOMContentLoaded", () => {
    const selectAllBtn = document.getElementById("select-all-btn");
    const deselectAllBtn = document.getElementById("deselect-all-btn");
    const checkboxes = document.querySelectorAll(".bulk-checkbox");
  
    // 全て選択ボタンの動作
    selectAllBtn.addEventListener("click", () => {
      checkboxes.forEach((checkbox) => {
        checkbox.checked = true;
      });
    });
  
    // 全て解除ボタンの動作
    deselectAllBtn.addEventListener("click", () => {
      checkboxes.forEach((checkbox) => {
        checkbox.checked = false;
      });
    });
  });

  document.addEventListener("DOMContentLoaded", () => {
    const selectAllCheckbox = document.getElementById("select-all");
    const individualCheckboxes = document.querySelectorAll(".bulk-checkbox");
  
    // 全選択チェックボックスの状態に応じて、各チェックボックスの状態を変更
    selectAllCheckbox.addEventListener("change", () => {
      individualCheckboxes.forEach((checkbox) => {
        checkbox.checked = selectAllCheckbox.checked;
      });
    });
  
    // 各チェックボックスの状態に応じて、全選択チェックボックスの状態を変更
    individualCheckboxes.forEach((checkbox) => {
      checkbox.addEventListener("change", () => {
        const allChecked = Array.from(individualCheckboxes).every((cb) => cb.checked);
        selectAllCheckbox.checked = allChecked;
        selectAllCheckbox.indeterminate = !allChecked && Array.from(individualCheckboxes).some((cb) => cb.checked);
      });
    });
  });
  