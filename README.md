# california_kelp_GBIF_OBIS

We were contacted by Kacy Cooper and Erin Satterthwaite asking for assistance in querying GBIF and OBIS for a California kelp dataset inventory. See emails below.


---

```

Re: [EXTERNAL] Request for kelp datasets from OBIS platform
Erin Satterthwaite <esatterthwaite@ucsd.edu>
Wed 12/6/2023 11:10 AM
​Formel, Stephen K <sformel@usgs.gov>​
​Benson, Abigail L <albenson@usgs.gov>;​Kacy Cooper - NOAA Affiliate <kacy.cooper@noaa.gov>​
Hi Steve,
This is super helpful! Assistance with the API would be amazing! We do only prefer the metadata and I do think it’s worth being a bit more precise and doing both OBIS and GBIF.  Our bounding box would be off CA (ideally state waters but since kelp generally are nearshore anyway the CA EEZ will work great. And yes, we just want metadata. 
Thanks again for helping to get us started! Hope you are well :) 
Best,
Erin 

On Wed, Dec 6, 2023 at 6:51 AM Formel, Stephen K <sformel@usgs.gov> wrote:
Yes, if you click on the download tab above the map, you can choose a variety of download options. It will give you all the occurrences, and you can filter it to those datasets.  "Simple" will give you just the csv and the DOI you can cite:

  

If you're really only looking for dataset metadata, we can do that through the API pretty easily.  Also, I'm not sure how y'all will be using this in the end, but if it's worth being more precise, so the OBIS and GBIF search is exactly the same, I'm happy to whip up the code and csv output for y'all, I just need a little more info:

Boundaries: US EEZ off California? or some bounding box or polygon?
output: Do you want all the occurrences, or just dataset metadata? 

Happy Holidays!
Steve
From: Erin Satterthwaite <esatterthwaite@ucsd.edu>
Sent: Monday, December 4, 2023 5:11 PM
To: Formel, Stephen K <sformel@usgs.gov>
Cc: Kacy Cooper - NOAA Affiliate <kacy.cooper@noaa.gov>; Benson, Abigail L <albenson@usgs.gov>

Subject: Re: [EXTERNAL] Request for kelp datasets from OBIS platform
 
Thanks, Stephen! One quick question -- is there a way from the view/link you shared to download a csv of the datasets (see list below)?
Best,
Erin







Abundance of Rocky Reef Fishes, Invertebrates and Algae, Reef Check California (RCCA), 2006 - 2017
37,641

iNaturalist Research-grade Observations
7,628

University of California Santa Barbara Algae Collection
156

The New York Botanical Garden Herbarium (NY)
151

Oregon State University Algae Collection
78

University of Michigan Herbarium
72

San Diego Natural History Museum - Algae
64

Gilbert M. Smith Herbarium
61

University of North Carolina at Chapel Hill Herbarium; Max & Fran Hommersand Algae Herbarium: Algae
52

MARINe/PISCO: Intertidal: MARINe Coastal Biodiversity Surveys: Point Contact Surveys Summarized
44

On Mon, Dec 4, 2023 at 12:58 PM Formel, Stephen K <sformel@usgs.gov> wrote:
Hi Kacy,

Since you're doing an inventory, it may be worth looking at GBIF too.  Here is a quick and dirty search of those two species off California: https://www.gbif.org/occurrence/map?has_coordinate=true&taxon_key=4267628&taxon_key=5422328&advanced=1&geometry=POLYGON((-128.63769%2016.27273,-108.68281%2016.27273,-108.68281%2048.34307,-128.63769%2048.34307,-128.63769%2016.27273))&occurrence_status=present

GBIF offers an R package, rgbif, and a python package, pygbif, to do this more programmatically.  Let me know if you'd like help refining the queries and comparing the results of the two databases.

Cheers,
Steve
From: Kacy Cooper - NOAA Affiliate <kacy.cooper@noaa.gov>
Sent: Monday, December 4, 2023 2:40 PM
To: Benson, Abigail L <albenson@usgs.gov>
Cc: Erin Satterthwaite <esatterthwaite@ucsd.edu>; Formel, Stephen K <sformel@usgs.gov>
Subject: Re: [EXTERNAL] Request for kelp datasets from OBIS platform
 
Hi Abby,

Thank you for getting back to us and sending the code! We'll take a look and then reach out to Steve if we have any questions.

Thanks again!

Best,
Kacy

On Mon, Dec 4, 2023 at 8:00 AM Benson, Abigail L <albenson@usgs.gov> wrote:
Hi Kacy,

This is pretty easy to do using the robis package in R. It probably makes the most sense for you to do it so you can change the parameters to fit your needs. Here is the code I used:
> areas <- robis::area()
Retrieved 798 records of approximately 798 (100%)
> View(areas)
> kelpList <- robis::dataset(scientificname = c("Macrocystis pyrifera","Nereocystis luetkeana"), areaid = 274)
Retrieved 6 records of approximately 6 (100%)
> View(kelpList)

OBIS AreaID 274 is the US North Pacific EEZ.

I am currently on a detail with USGCRP working on the US National Nature Assessment (call for authors out now! 🙂) so I've cc'ed Steve Formel who is now the node manager for OBIS-USA and should be able to assist you further if needed.

Warmly,
Abby
From: Kacy Cooper - NOAA Affiliate <kacy.cooper@noaa.gov>
Sent: Thursday, November 30, 2023 3:32 PM
To: Benson, Abigail L <albenson@usgs.gov>
Cc: Erin Satterthwaite <esatterthwaite@ucsd.edu>
Subject: [EXTERNAL] Request for kelp datasets from OBIS platform
 
 

 This email has been received from outside of DOI - Use caution before clicking on links, opening attachments, or responding.  




Hi Abby,

Hope you're doing well! I'm a 2023 California Sea Grant Fellow working with Erin Satterthwaite on the California Kelp Restoration and Management Plan. As part of this project, I am helping to create an inventory of kelp-relevant ecological and social datasets.

We are reaching out to see if you could help us obtain a list of kelp-related datasets within the OBIS platform. Erin mentioned you would be a good person to connect with. 

Specifically, we are wondering if you could send us a list of all giant and bull kelp (Macrocystis pyrifera and Nereocystis luetkeana) relevant datasets within the OBIS platform with metadata including dataset name, program, contact name, and email/phone number), preferably as a csv file. We are only focusing on kelp data within California waters. 

Is this something that you can help with? If not, could you recommend or put us in contact with someone who could?

I'm happy to hop on a call to discuss further and answer any questions. We look forward to hearing from you!

Best,
Kacy

--
Kacy Cooper (she/her)
2023 California Sea Grant State Fellow
NOAA Channel Islands National Marine Sanctuary
805-203-6004 | kacy.cooper@noaa.gov


--

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Erin Satterthwaite | she/her
Marine Ecologist & Sustainability Researcher 
CalCOFI Program Coordinator 
UC San Diego - Scripps Institution of Oceanography
California Sea Grant & CalCOFI
9500 Gilman Dr., La Jolla, CA 92093-0232
work: (858) 380-5835

Play is the highest form of research 
                                    ~Albert Einstein
```
