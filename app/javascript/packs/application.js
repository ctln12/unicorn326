import "bootstrap";
import "bootstrap-select";

require('dotenv').config()

import { initOpenTok } from "./lesson";

initOpenTok();

import algoliasearch from "algoliasearch";
import instantsearch from "instantsearch.js";
import { searchBox, hits, currentRefinements, clearRefinements, sortBy, refinementList, pagination, stats } from "instantsearch.js/es/widgets";

const tutors = document.getElementById('tutors');

if (tutors) {
  const searchClient = algoliasearch("11UNBLSZP5", "1beb4d87ba411f5793a0645f224e90ce");

  const search = instantsearch({
    indexName: "Tutor_development",
    searchClient,
  });

  search.addWidgets([
    searchBox({
      container: "#searchbox",
      placeholder: "Search for a subject, language, country, currency, tutor's name, ...",
    }),

    hits({
      container: "#hits",
      templates: {
        item: `
        <div>
          <img src="{{image}}" align="left" alt="{{name}}" />
          <div class="hit-name">
            <h4>
              {{first_name}}
              {{last_name}}
            </h4>
          </div>
          <div class="hit-country">
            {{country}}
          </div>
          <div class="hit-price">
            {{currency}}
            {{price}}
            / h
          </div>
          <div class="hit-subjects">
            Teaches:
            {{#subjects}}
              <span>{{name}}</span>
            {{/subjects}}
          </div>
          <div class="hit-languages">
            Speaks:
            {{#languages}}
              <span>{{name}}</span>
            {{/languages}}
          </div>
          <div class="hit-rating">
            Rating:
            {{average_rating}}
          </div>
          <a href='tutors/{{id}}' class='btn btn-primary'>View profile</a>
        </div>
      `,
      },
    }),

    stats({
      container: "#results-number",
    }),

    currentRefinements({
      container: '#current-filters',
    }),

    clearRefinements({
      container: "#clear-filters",
      templates: {
        resetLabel: 'Clear all',
      },
    }),

    sortBy({
      container: '#sort-by',
      items: [
        { label: 'Most relevant', value: 'Tutor_development' },
        // { label: 'Popularity', value: 'Tutor_by_rating_desc_development' },
        { label: 'Price (asc)', value: 'Tutor_by_price_asc_development' },
        { label: 'Price (desc)', value: 'Tutor_by_price_desc_development' },
      ],
    }),

    refinementList({
      container: '#subjects-list',
      attribute: 'subjects.name',
      limit: 3,
      showMore: true,
    }),

    refinementList({
      container: '#languages-list',
      attribute: 'languages.name',
      limit: 3,
      showMore: true,
    }),

    refinementList({
      container: '#countries-list',
      attribute: 'country',
      limit: 3,
      showMore: true,
    }),

    refinementList({
      container: '#currencies-select',
      attribute: 'currency',
      limit: 3,
      showMore: true,
    }),

    pagination({
      container: "#pagination",
      scrollTo: "#hits",
    })

  ]);

  search.start();
}
