import "bootstrap";
import "bootstrap-select";

require('dotenv').config()

import { initOpenTok } from "./lesson";

initOpenTok();

import algoliasearch from "algoliasearch";
import instantsearch from "instantsearch.js";
import { searchBox, hits } from "instantsearch.js/es/widgets";

const tutors = document.getElementById('tutors');

if (tutors) {
  const searchClient = algoliasearch("11UNBLSZP5", "1beb4d87ba411f5793a0645f224e90ce");

  const search = instantsearch({
    indexName: "Tutor",
    searchClient,
  });

  search.addWidgets([
    searchBox({
      container: "#searchbox",
    }),

    hits({
      container: "#hits",
      templates: {
        item: `
        <div>
          <img src="{{image}}" align="left" alt="{{name}}" />
          <div class="hit-name">
            <h4>
              {{#helpers.highlight}}{ "attribute": "first_name" }{{/helpers.highlight}}
              {{#helpers.highlight}}{ "attribute": "last_name" }{{/helpers.highlight}}
            </h4>
          </div>
          <div class="hit-country">
            <p>{{#helpers.highlight}}{ "attribute": "country" }{{/helpers.highlight}}</p>
          </div>
          <div class="hit-price">
            {{#helpers.highlight}}{ "attribute": "currency" }{{/helpers.highlight}}
            {{#helpers.highlight}}{ "attribute": "price" }{{/helpers.highlight}}
          </div>
          <div class="hit-subjects">
            {{#subjects}}
              <span>{{name}}</span>
            {{/subjects}}
          </div>
          <div class="hit-languages">
            {{#languages}}
              <span>{{name}}</span>
            {{/languages}}
          </div>
          <div class="hit-rating">
            {{#helpers.highlight}}{ "attribute": "average_rating" }{{/helpers.highlight}}
          </div>
          <a href='tutors/{{id}}' class='btn btn-primary'>View profile</a>
        </div>
      `,
      },
    }),
  ]);

  search.start();
}
