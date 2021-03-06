<div class="js-start">
  <div class="CDB-Text Dialog-header u-inner">
    <div class="Dialog-headerIcon Dialog-headerIcon--neutral">
      <i class="CDB-IconFont CDB-IconFont-cloudDownArrow"></i>
    </div>
    <p class="Dialog-headerTitle">Export dataset</p>
    <p class="Dialog-headerText">Select the preferred file format.</p>
    <% if (!isGeoreferenced) { %>
      <p class="Dialog-headerText">To download any geospatial format like SHP, KML or GeoJSON don't forget to select the_geom on your query.</p>
    <% } %>
  </div>

  <div class="CDB-Text Dialog-body">
    <% if (hasBounds) { %>
      <div class="OptionCheck">
        <div class="Checkbox js-bounds">
          <button class="Checkbox-input is-checked"></button>
          <label class="Checkbox-label"><strong class="Checkbox-strong">Match rows with the map view.</strong> This option reduces file size.</label>
        </div>
      </div>
    <% } %>

    <div class="OptionCards">
      <% _.each( formats, function( format ){ %>
       <div data-format="<%- format.format %>"
            class="js-option OptionCard OptionCard--onlyIcons <%
              if (isGeoreferenced === false && format.geomRequired === true) { %> is-disabled <% }
            %>">
         <div class="IllustrationIcon <%- format.illustrationIconModifier %>">
           <div class="IllustrationIcon-text"><%- format.label || format.format %></div>
         </div>
       </div>
      <% }); %>
    </div>
  </div>

  <div class="Dialog-footer Dialog-footer--simple u-inner">
    <button class="CDB-Text CDB-Button CDB-Button--secondary CDB-Size-medium u-upperCase cancel js-close">
      <span>Cancel</span>
    </button>
  </div>
</div>

<div class="CDB-Text js-preparing-download" style="display: none;">
  <%- preparingDownloadContent %>
</div>

<div class="CDB-Text js-error" style="display: none;"></div>

<form class="hack" method="POST" action="<%- url %>">
  <input type="hidden" class="filename" name="filename" />
  <input type="hidden" class="q" name="q" />
  <input type="hidden" class="format" name="format" />
  <input type="hidden" class="bounds" name="bounds" />
  <input type="hidden" class="api api_key" name="api_key" />
  <input type="hidden" class="skipfields" name="skipfields" disabled="disabled" value="" />
  <input type="hidden" class="dp" name="dp" value="4" disabled="disabled" />
</form>
