# Overview (v.3.5.0-testing)

*Welcome to the Spyderisk System Modeller Documentation*

The Spyderisk System Modeller (SSM) provides a thorough risk assessment of complex systems making use of context and connectivity to take into account the web of attack paths and secondary threat cascades in a system.

Spyderisk assists the user in following the risk assessment process defined in ISO 27005 and thus supports the Information Security Management System defined in ISO 27001. The Spyderisk System Modeller is a generic risk assessment tool and must be configured with a model of a domain ("knowledgebase"), containing the available asset types and relations, descriptions of the threats, the possible security controls, and more. The software comes bundled with a knowledgebase for complex networked information systems.

The web-based graphical user interface guides the user through the following steps:

1. The user draws a model of their system model by dragging and dropping typed assets linked by typed relations onto a canvas.
2. The software analyses the model, inferring network paths, data flows, client-service trust relationships and much more (depending on the knowledgebase).
3. The software analyses the model to find all the threats and potential controls that are encoded in the knowledgebase. The threats are automatically chained together via their consequences to create long-reaching and inter-linked attack graphs and secondary threat cascades through the system.
4. The user assigns impact levels to various failure modes on the primary assets only.
5. The user can add controls to the model to reduce the likelihood of threats.
6. The software does a risk analysis, considering the external environment, the defined impact levels, the controls, and the chains of threats that have been discovered. The threats and consequences may then be ranked by their risk, highlighting the most important problems.
7. The user can choose to add or change the controls (back to step 5), to redesign the system (step 1), or to accept the system design.
8. The software can output reports describing the system along with the threats, consequences and their risk levels.

The knowledgebase describes threats through patterns of multiple assets along with their context (such as network or physical location), rather than assuming that threats relate to a single asset type. Similarly, methods to reduce threat likelihood ("control strategies") may comprise multiple controls on different assets (for example, both an X509 certificate at a service and verification of the certificate at the client). Knowledgebases may also be designed such that control strategies help solve one problem but exacerbate another (for example, adding a password reduces the likelihood of unauthorised access to a service but increases the likelihood of the legitimate user failing to get in). All this provides a high degree of realism to the analysis.

With a compatible knowledgebase, the software can perform a both long-term risk assessment suitable for when designing a system, and an operational (or "runtime") risk assessment using a short time horizon. Different controls are appropriate in each case (for instance, implementing a new staff security training policy does not help with an ongoing attack, but blocking a network path does). For the operational risk assessment, the state of the system model must first be synchronised with the current operational state (for instance through integration via the API with OpenVAS or a SIEM).

Development of the software began in 2013, drawing on research dating back to 2008. It was open-sourced in early 2023. The research and development up to the point of open sourcing was done solely by the [University of Southampton IT Innovation Centre](http://www.it-innovation.soton.ac.uk/) in a variety of UK and EU research projects.
