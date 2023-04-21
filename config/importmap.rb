# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "feather-icons", to: "https://ga.jspm.io/npm:feather-icons@4.28.0/dist/feather.js"
pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@2.9.4/dist/Chart.js"
pin "moment", to: "https://ga.jspm.io/npm:moment@2.29.4/moment.js"
pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true
