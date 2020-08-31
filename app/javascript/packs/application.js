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
      cssClasses: {
        input: 'input-style'
      }
    }),

    hits({
      container: "#hits",
      templates: {
        item: `
        <div class="card tutor-card">
          <img class="card-img-top tutor-card-img" src="https://www.lifewire.com/thmb/xVByvioteKa61v_yrpENqbYROWI=/1300x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/find-anyone-online-3482687-91a015d74d794f77b299703eff0f47a9.png" align="left" alt="tutor's photo">
          <div class="card-body">
            <h4 class="card-title tutor-card-title hit-name">
              {{first_name}}
              {{last_name}}
              <p class="card-text tutor-card-country hit-country">{{country}}</p>
            </h4>
            <p class="card-text hit-price">
              {{currency}}
              {{price}}
            </p>
            <p class="card-text hit-subjects">
              Teaches:
              {{#subjects}}
                <span>{{name}}</span>
              {{/subjects}}
            </p>
            <p class="card-text hit-languages">
              Speaks:
              {{#languages}}
                <span>{{name}}</span>
              {{/languages}}
            </p>
            <p class="card-text hit-rating">
              Rating:
              {{average_rating}}
            </p>
            <a href='tutors/{{id}}' class='btn btn-primary'>View profile</a>
          </div>
        </div>
      `,
      },
      cssClasses: {
        root: 'search-results',
        list: 'tutors-list row',
        item: 'tutor col-12 col-sm-6',
      },
    }),

    stats({
      container: "#results-number",
    }),

    currentRefinements({
      container: '#current-filters',
      cssClasses: {
        item: 'filter-tag',
        label: 'dark-blue-color',
        categoryLabel: 'dark-blue-color',
        delete: 'dark-blue-color'
      }
    }),

    clearRefinements({
      container: "#clear-filters",
      templates: {
        resetLabel: 'Clear filters',
      },
      cssClasses: {
        button: 'dark-blue-color'
      }
    }),

    sortBy({
      container: '#sort-by',
      cssClasses: {
        select: 'custom-select'
      },
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
      templates: {
        showMoreText: `
        {{#isShowingMore}}
          <i class="fas fa-chevron-up"></i>
          less
        {{/isShowingMore}}
        {{^isShowingMore}}
          <i class="fas fa-chevron-down"></i>
          more
        {{/isShowingMore}}
        `,
      },
      cssClasses: {
        showMore: 'more-button',
      }
    }),

    refinementList({
      container: '#languages-list',
      attribute: 'languages.name',
      limit: 3,
      showMore: true,
      templates: {
        showMoreText: `
        {{#isShowingMore}}
          <i class="fas fa-chevron-up"></i>
          less
        {{/isShowingMore}}
        {{^isShowingMore}}
          <i class="fas fa-chevron-down"></i>
          more
        {{/isShowingMore}}
        `,
      },
      cssClasses: {
        showMore: 'more-button',
      }
    }),

    refinementList({
      container: '#countries-list',
      attribute: 'country',
      limit: 3,
      showMore: true,
      templates: {
        showMoreText: `
        {{#isShowingMore}}
          <i class="fas fa-chevron-up"></i>
          less
        {{/isShowingMore}}
        {{^isShowingMore}}
          <i class="fas fa-chevron-down"></i>
          more
        {{/isShowingMore}}
        `,
      },
      cssClasses: {
        showMore: 'more-button',
      }
    }),

    refinementList({
      container: '#currencies-select',
      attribute: 'currency',
      limit: 3,
      showMore: true,
      templates: {
        showMoreText: `
        {{#isShowingMore}}
          <i class="fas fa-chevron-up"></i>
          less
        {{/isShowingMore}}
        {{^isShowingMore}}
          <i class="fas fa-chevron-down"></i>
          more
        {{/isShowingMore}}
        `,
      },
      cssClasses: {
        showMore: 'more-button',
      }
    }),

    pagination({
      container: "#pagination",
      scrollTo: "#hits",
    })

  ]);

  search.start();
}

/* <div>
  <img src="https://www.lifewire.com/thmb/xVByvioteKa61v_yrpENqbYROWI=/1300x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/find-anyone-online-3482687-91a015d74d794f77b299703eff0f47a9.png" align="left" class="tutor-image" alt="photo" />
  <div class="hit-name">
    <h4>
      {{ first_name }}
      {{ last_name }}
    </h4>
  </div>
  <div class="hit-country">
    {{ country }}
  </div>
  <div class="hit-price">
    {{ currency }}
    {{ price }}
            / h
          </div>
  <div class="hit-subjects">
    Teaches:
            {{ #subjects}}
    <span>{{ name }}</span>
    {{/ subjects}}
          </div>
  <div class="hit-languages">
    Speaks:
            {{ #languages}}
    <span>{{ name }}</span>
    {{/ languages}}
          </div>
  <div class="hit-rating">
    Rating:
            {{ average_rating }}
  </div>
  <a href='tutors/{{id}}' class='btn btn-primary'>View profile</a>
</div> */
