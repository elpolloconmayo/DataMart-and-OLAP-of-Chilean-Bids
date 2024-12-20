CREATE TABLE "proveedor" (
  "idProveedor" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "rutProveedor" varchar NOT NULL,
  "nombreProveedor" varchar NOT NULL,
  "tamanoProveedor" varchar NOT NULL,
  "actividadProveedor" varchar NOT NULL,
  "regionProveedor" varchar NOT NULL
);

CREATE TABLE "rubro" (
  "idRubro" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "rubro1" varchar,
  "rubro2" varchar,
  "macroRubro1" varchar,
  "macroRubro2" varchar
);

CREATE TABLE "comprador" (
  "idComprador" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "rutUnidadComprador" varchar NOT NULL,
  "nombreUnidadCompradora" varchar NOT NULL,
  "codigoInstitucionCompradora" varchar NOT NULL,
  "nombreInstitucionCompradora" varchar NOT NULL,
  "regionUnidadCompradora" varchar NOT NULL
);

CREATE TABLE "contrato" (
  "idContrato" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "contrato" varchar,
  "subContrato" varchar,
  "unidadTiempoDuracion" varchar,
  "plazoPagoContrato" varchar,
  "tipoEjecucionContrato" varchar,
  "tipoPagoContrato" varchar,
  "extensionPlazo" varchar
);

CREATE TABLE "region" (
  "idRegion" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "nombreRegion" varchar NOT NULL,
  "macroZona" varchar NOT NULL,
  "nombreRegionCo" varchar NOT NULL
);

CREATE TABLE "oferta" (
  "idOferta" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "nombreOferta" varchar,
  "estadoOferta" varchar,
  "resultadoOferta" varchar
);

CREATE TABLE "producto" (
  "idProducto" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "codigoProducto" varchar NOT NULL,
  "nombreItem" varchar NOT NULL,
  "descripcionItem" varchar NOT NULL,
  "unidadMedidaItem" varchar NOT NULL,
  "categoria" varchar
);

CREATE TABLE "licitacion" (
  "nroLicitacion" varchar PRIMARY KEY NOT NULL,
  "tipoLicitacion" varchar NOT NULL,
  "nombreLicitacion" varchar NOT NULL,
  "estadoLicitacion" varchar NOT NULL,
  "descripcion" varchar NOT NULL,
  "contemplaObrasPublicas" varchar NOT NULL,
  "licitacionInformada" varchar NOT NULL
);

CREATE TABLE "annio" (
  "idAnnio" int PRIMARY KEY NOT NULL
);

CREATE TABLE "mes" (
  "idMes" int PRIMARY KEY NOT NULL,
  "idAnnio" int NOT NULL,
  "semestreMes" int NOT NULL,
  "numeroMes" int NOT NULL,
  "nombreMes" varchar
);

CREATE TABLE "dia" (
  "idDia" int PRIMARY KEY NOT NULL,
  "idMes" inet6,
  "nombreDia" varchar,
  "numeroDiaMes" int
);

CREATE TABLE "hecho_licitacion" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "idLicitacion" varchar NOT NULL,
  "idComprador" int NOT NULL,
  "idProveedor" int NOT NULL,
  "idOferta" int NOT NULL,
  "idProducto" INT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  "idContrato" int NOT NULL,
  "idDia" int NOT NULL,
  "idRubro" int NOT NULL,
  "idRegionComprador" int NOT NULL,
  "idRegionProveedor" int NOT NULL,
  "fechaPublicacion" date NOT NULL,
  "fechaCierre" date NOT NULL,
  "fechaAdjudicacion" date NOT NULL,
  "cantidadItem" int NOT NULL,
  "cantidadOferta" int NOT NULL,
  "montoEstimadoLicitacion" int8 NOT NULL,
  "montoNetoOferta" int8 NOT NULL,
  "montoTotalOferta" int8 NOT NULL
);

CREATE INDEX "idx_rutProveedor" ON "proveedor" ("rutProveedor");

CREATE INDEX "idx_nombreProveedor" ON "proveedor" ("nombreProveedor");

CREATE INDEX "idx_rutUnidadComprador" ON "comprador" ("rutUnidadComprador");

CREATE INDEX "idx_nombreUnidadCompradora" ON "comprador" ("nombreUnidadCompradora");

CREATE INDEX "idx_idAnnio" ON "mes" ("idAnnio");

CREATE INDEX "idx_idMes" ON "dia" ("idMes");

CREATE INDEX "idx_idLicitacion" ON "hecho_licitacion" ("idLicitacion");

CREATE INDEX "idx_idComprador" ON "hecho_licitacion" ("idComprador");

CREATE INDEX "idx_idProveedor" ON "hecho_licitacion" ("idProveedor");

CREATE INDEX "idx_idOferta" ON "hecho_licitacion" ("idOferta");

CREATE INDEX "idx_idProducto" ON "hecho_licitacion" ("idProducto");

CREATE INDEX "idx_idContrato" ON "hecho_licitacion" ("idContrato");

CREATE INDEX "idx_idDia" ON "hecho_licitacion" ("idDia");

CREATE INDEX "idx_idRegionComprador" ON "hecho_licitacion" ("idRegionComprador");

CREATE INDEX "idx_idRegionProveedor" ON "hecho_licitacion" ("idRegionProveedor");

CREATE INDEX "idx_fechaPublicacion" ON "hecho_licitacion" ("fechaPublicacion");

CREATE INDEX "idx_fechaCierre" ON "hecho_licitacion" ("fechaCierre");

CREATE INDEX "idx_fechaAdjudicacion" ON "hecho_licitacion" ("fechaAdjudicacion");

ALTER TABLE "hecho_licitacion" ADD FOREIGN KEY ("idLicitacion") REFERENCES "licitacion" ("nroLicitacion");

ALTER TABLE "hecho_licitacion" ADD FOREIGN KEY ("idComprador") REFERENCES "comprador" ("idComprador");

ALTER TABLE "hecho_licitacion" ADD FOREIGN KEY ("idProveedor") REFERENCES "proveedor" ("idProveedor");

ALTER TABLE "hecho_licitacion" ADD FOREIGN KEY ("idOferta") REFERENCES "oferta" ("idOferta");

ALTER TABLE "hecho_licitacion" ADD FOREIGN KEY ("idProducto") REFERENCES "producto" ("idProducto");

ALTER TABLE "hecho_licitacion" ADD FOREIGN KEY ("idContrato") REFERENCES "contrato" ("idContrato");

ALTER TABLE "hecho_licitacion" ADD FOREIGN KEY ("idDia") REFERENCES "dia" ("idDia");

ALTER TABLE "hecho_licitacion" ADD FOREIGN KEY ("idRubro") REFERENCES "rubro" ("idRubro");

ALTER TABLE "mes" ADD FOREIGN KEY ("idAnnio") REFERENCES "annio" ("idAnnio");

ALTER TABLE "dia" ADD FOREIGN KEY ("idMes") REFERENCES "mes" ("idMes");

ALTER TABLE "hecho_licitacion" ADD FOREIGN KEY ("idRegionComprador") REFERENCES "region" ("idRegion");

ALTER TABLE "hecho_licitacion" ADD FOREIGN KEY ("idRegionProveedor") REFERENCES "region" ("idRegion");
