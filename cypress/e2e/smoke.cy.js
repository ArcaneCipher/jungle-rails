// cypress/e2e/smoke.cy.js
describe("Jungle home page", () => {
  it("visits the home page", () => {
    cy.visit("/");
    cy.get("body").should("exist");
  });
});
