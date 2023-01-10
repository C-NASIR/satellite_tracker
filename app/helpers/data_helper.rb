# This helper provides access to needed data like a hash of all available constellations and 
# documentation API 
module DataHelper
    #Return a hash of all the available data 
    def get_constellations_name_hash
        # I would like to move this hash to its own file 
        names = { 'NAVSTAR' => true, 'NOAA' => true, 'GOES' => true, 'WESTFORD' => true,
            'GLONASS' => true, 'GORIZONT' => true, 'GONETS' => true, 'GALILEO' => true,
            'CSS' => true, 'YAOGAN' => true, 'IRNSS' => true, 'STARLINK' => true, 'GLOBALSTAR' => true,
            'ORBCOMM' => true, 'BEIDOU' => true, 'FLOCK' => true, 'LEMUR' => true, 'JILIAN' => true,
            'ONEWEB' => true, 'IRIDIUM' => true, 'ASTRO' => true, 'FOSSA' => true, 'INTELSAT' => true,
            'O3B' => true
        }
    end

    # Return a json of the documentation
    def get_endpoint_documentation
        # result should be moved to a data file, where we can easily import it 
        result = {
        'endpoints' => {
            '/satcat/info' => 'Get examples of how the api can be called',
            '/satcat/noradcatid?id=4' => 'Search an object by NORAD_CAT_ID. Example, we are searching object id 4',
            '/satcat/Intldes?id=2022-179A' => 'Search an object by INTLDES. Example we are searching object id 2022-179A',
            '/satcat/launch?date=1957-10-04' => 'Search objects by LAUNCH date. Example we are searching objects launched on 1957-10-04',
            '/satcat/constellation/' => {
            'description' => 'Search satellites in  specific constellation',
            '/satcat/constellation?name=starlink' => 'Search satellites in starlink constellation',
            '/satcat/constellation?name=starlink&limit=10' => 'Limit the result to 10 objects',
            '/satcat/constellation?name=starlink&offset=10' => 'Offset items by 10. Will return item 11 - 60',
            '/satcat/constellation?name=starlink&limit=20&offset=10' => 'Limit result to 20 and Offset 10. Will return 11-30',
            'default' => 'default limit is 50 and default offset is 10'
            }
        },
        'available satellite constellations' => {
            'Global Positioning System (GPS)' => {
            'description' => 'The Global Positioning System (GPS), originally Navstar GPS is a satellite-based radionavigation system owned by the United States government and operated by the United States Space Force.',
            'searchable term' => 'NAVSTAR'
            },
            'The National Oceanic and Atmospheric Administration' => {
            'description' => 'The National Oceanic and Atmospheric Administration is an United States scientific and regulatory agency within the United States Department of Commerce that forecasts weather, monitors oceanic and atmospheric conditions, charts the seas, conducts deep sea exploration, and manages fishing and protection of marine mammals and endangered species in the U.S.',
            'searchable term' => 'NOAA'
            },
            'The Geostationary Operational Environmental Satellite' => {
            'description' => "The Geostationary Operational Environmental Satellite (GOES), operated by the United States' National Oceanic and Atmospheric Administration (NOAA)'s National Environmental Satellite, Data, and Information Service division, supports weather forecasting, severe storm tracking, and meteorology research.",
            'searchable term' => 'GOES'
            },
            'WESTFORD NEEDLES' => {
            'description' => "Project West Ford (also known as Westford Needles and Project Needles) was a test carried out by Massachusetts Institute of Technology's Lincoln Laboratory on behalf of the United States Military in 1961 and 1963 to create an artificial ionosphere above the Earth. This was done to solve a major weakness that had been identified in US military communications.",
            'searchable term' => 'WESTFORD'
            },
            'GLONASS CONSTELLATION SATELLITES' => {
            'description' => "GLONASS (ГЛОНАСС, IPA: [ɡɫɐˈnas]; Russian: Глобальная навигационная спутниковая система, tr. Global'naya Navigatsionnaya Sputnikovaya Sistema, lit. 'Global Navigation Satellite System') is a Russian satellite navigation system operating as part of a radionavigation-satellite service. It provides an alternative to Global Positioning System (GPS) and is the second navigational system in operation with global coverage and of comparable precision.",
            'searchable term' => 'GLONASS'
            },
            'GORIZONT' => {
            'description' => 'Gorizont (Russian: Горизонт, Horizon), GRAU index 11F662, is a series of 35 Russian, previously Soviet, geosynchronous communications satellites launched between 1978 and 2000. The programme was started in order to develop a satellite system to relay coverage of the 1980 Olympic Games from Moscow.',
            'searchable term' => 'GORIZONT'
            },
            'GONETS' => {
            'description' => 'Gonets (Russian Гонец, for Messenger) is a Russian civilian low Earth orbit communications satellite system. It consists of a number of satellites, derived from Strela military communications satellites. The first two satellites, which were used to test and validate the system, were launched by a Tsyklon-3 launch vehicle from the Plesetsk Cosmodrome on 13 July 1992 and were designated Gonets-D.',
            'searchable term' => 'GONETS'
            },
            'Galileo is a global navigation satellite system (GNSS) ' => {
            'description' => "Galileo is a global navigation satellite system (GNSS) that went live in 2016 created by the European Union through the European Space Agency (ESA), operated by the European Union Agency for the Space Programme (EUSPA), headquartered in Prague, Czech Republic with two ground operations centres in Fucino, Italy, and Oberpfaffenhofen, Germany.",
            'searchable term' => 'GALILEO'
            },
            'CHINESE SPACE STATION SATELLITES' => {
            'description' => 'The Tiangong Space Station, is a Space Station placed in low Earth orbit between 340–450 km (210–280 mi) above the surface. The Tiangong Space Station, once completed, will be roughly one-fifth the mass of the International Space Station and about the size of the decommissioned Russian Mir space station.',
            'searchable term' => 'CSS'
            },
            'YAOGAN' => {
            'description' => "Yaogan (simplified Chinese: 遥感卫星; traditional Chinese: 遙感衞星; pinyin: Yáogǎn Wèixīng; lit. 'Remote Sensing Satellite') is the cover name used by the People's Republic of China to refer to its military reconnaissance satellites.",
            'searchable term' => 'YAOGAN'
            },
            'The Indian Regional Navigation Satellite System' => {
            'description' => "The Indian Regional Navigation Satellite System (IRNSS), with an operational name of NavIC (acronym for 'Navigation with Indian Constellation; also, nāvik 'sailor' or 'navigator' in Indian languages),[2] is an autonomous regional satellite navigation system that provides accurate real-time positioning and timing services.[3] It covers India and a region extending 1,500 km (930 mi) around it, with plans for further extension. ",
            'searchable term' => 'IRNSS'
            },
            'Starlink' => {
            'description' => 'Starlink is a satellite internet constellation operated by SpaceX, providing satellite Internet access coverage to 45 countries. It also aims for global mobile phone service after 2023.',
            'searchable term' => 'Starlink'
            },
            'Globalstar' => {
            'description' => 'is an American satellite communications company that operates a low Earth orbit (LEO) satellite constellation for satellite phone and low-speed data communications. The Globalstar second-generation constellation consists of 24 low Earth orbiting (LEO) satellites.[1]',
            'searchable term' => 'Globalstar'
            },
            'Orbcomm' => {
            'description' => 'ORBCOMM is an American company that offers industrial Internet of things (IoT) and machine to machine (M2M) communications hardware, software and services designed to track, monitor, and control fixed and mobile assets in markets including transportation, heavy equipment, maritime, oil and gas, utilities and government. The company provides hardware devices, modems, web applications, and data services delivered over multiple satellite and cellular networks.',
            'searchable term' => 'Orbcomm'
            },
            'BeiDou Navigation Satellite System' => {
            'description' => 'The BeiDou Navigation Satellite System is a Chinese satellite navigation system. It consists of two separate satellite constellations.',
            'searchable term' => 'BEIDOU'
            },
            'Planet (Flock/ Dove/SuperDove)' => {
            'description' => 'is an American public Earth imaging company based in San Francisco, California. Their goal is to image the entirety of the Earth daily to monitor changes and pinpoint trends.',
            'searchable term' => 'Flock'
            },
            'Spire (Lemur / Minas)' => {
            'description' => 'Spire Global, Inc. is a space-to-cloud data and analytics company that specializes in the tracking of global data sets powered by a large constellation of nanosatellites, such as the tracking of maritime, aviation and weather patterns.',
            'searchable term' => 'Lemur'
            },
            'Chang Guang (Jilin-1)' => {
            'description' => "Jilian-1 is China's first self-developed commercial remote sensing satellite system. The satellites are operated by Chang Guang Satellite Technology Corporation and named after Jilin Province where the company is headquartered. The first set of satellites were launched by Long March 2D in Jiuquan Satellite Launch Center on 7 October 2015, at 04:13 UTC.[2] All launched Jilin-1 satellites are in sun-synchronous orbit (SSO).",
            'searchable term' => 'Jilin'
            },
            'OneWeb' => {
            'description' => 'OneWeb is a communications company that aims to build broadband satellite Internet services.The company is headquartered in London, and has offices in Virginia, US and a satellite manufacturing facility in Florida OneWeb Satellites that is a joint venture with Airbus Defence and Space.',
            'searchable term' => 'Oneweb'
            },
            'Iridium' => {
            'description' => 'Iridium Communications Inc is a publicly traded American company headquartered in McLean, Virginia. Iridium operates the Iridium satellite constellation, a system of 66 active satellites and 9 in-orbit spares[2] used for worldwide voice and data communication from hand-held satellite phones and other transceiver units.[3] The nearly polar orbit and communication between satellites via inter-satellite links provide global service availability.',
            'searchable term' => 'Iridium'
            },
            'Astro Digital (Landmapper)' => {
            'description' => 'Astro Digital, or previously Aquila Space, is a company that is interested in providing high resolution multi-spectral images of the arable and populated land on Earth. The company was founded by Bronwyn Agrios, Chris Biddy, Jan King, and Mikhail Kokorich, in 2014, in Mountain View, California, United States.',
            'searchable term' => 'Astro'
            },
            'Fossa Systems' => {
            'description' => 'FOSSA Systems is a Spanish company that provides global and affordable IoT Connectivity for industrial applications, with assets in remote areas, through satellite communications. ',
            'searchable term' => 'Fossa'
            },
            'Intelsat' => {
            'description' => 'Intelsat S.A. (formerly INTEL-SAT, INTELSAT, Intelsat) is a multinational satellite services provider with corporate headquarters in Luxembourg and administrative headquarters in Tysons Corner, Virginia, United States.',
            'searchable term' => 'INTELSAT'
            },
            'O3B NETWORKS SATELLITES' => {
            'description' => 'O3b Networks Ltd. was a network communications service provider building and operating a medium Earth orbit (MEO) satellite constellation primarily intended to provide voice and data communications to mobile operators and Internet service providers. O3b Networks became a wholly owned subsidiary of SES S.A. in 2016 and the operator name was subsequently dropped in favour of SES Networks, a division of SES. The satellites themselves, now part of the SES fleet, continue to use the O3b name.',
            'searchable term' => 'O3B'
            },        
            }
        }
    end
end
