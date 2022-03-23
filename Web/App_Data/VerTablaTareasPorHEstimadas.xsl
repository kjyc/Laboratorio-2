<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="tareas">
		<html>
			<H3> Lista de tareas de la asignatura selecionada</H3>
			<body>
				<table class="table table-hover">
					<thead style="background-color: #212529; color: white">
						<tr>
							<td>Código</td>
							<td>Descripción</td>
							<td>H. Estimadas</td>
							<td>Tipo</td>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="./tarea">
							<xsl:sort select="./hestimadas"/>
							<tr>
								<td>
									<xsl:value-of select="./@codigo"/>
								</td>
								<td>
									<xsl:value-of select="./descripcion"/>
								</td>
								<td>
									<xsl:value-of select="./hestimadas"/>
								</td>
								<td>
									<xsl:value-of select="./tipotarea"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>