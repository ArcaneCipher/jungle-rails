describe("Jungle home page", () => {
  it("visits the home page", () => {
    cy.visit("/");
    cy.get("body").should("exist");
  });

  it("There is products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });
});
