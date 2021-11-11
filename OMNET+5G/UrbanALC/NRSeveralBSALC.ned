//
// SPDX-FileCopyrightText: 2020 Friedrich-Alexander University Erlangen-Nuernberg (FAU), Computer Science 7 - Computer Networks and Communication Systems
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program; if not, see <http://www.gnu.org/licenses/>.
//

import inet.node.ethernet.Eth10G;

import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.inet.AdhocHost;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.node.ethernet.Eth10G;

import nr.world.radio.NRChannelControl;
import nr.corenetwork.binder.NRBinder;

import org.car2x.veins.subprojects.veins_inet.VeinsInetManager;
import org.car2x.veins.modules.obstacle.ObstacleControl;
import org.car2x.veins.modules.world.annotations.AnnotationManager;
import org.car2x.veins.base.modules.BaseWorldUtility;
import org.car2x.veins.visualizer.roads.RoadsCanvasVisualizer;

import nr.corenetwork.nodes.UPF;
import nr.corenetwork.nodes.gNodeB;
import nr.corenetwork.nodes.GeneralParameters;


network NRSeveralBSALC extends GeneralParameters
{
    parameters:
        double playgroundSizeX @unit(m); // x size of the area the nodes are in (in meters)
        double playgroundSizeY @unit(m); // y size of the area the nodes are in (in meters)
        double playgroundSizeZ @unit(m); // z size of the area the nodes are in (in meters)
        @display("bgb=5000,5000");

    submodules:

        world: BaseWorldUtility {
            parameters:
                playgroundSizeX = playgroundSizeX;
                playgroundSizeY = playgroundSizeY;
                playgroundSizeZ = playgroundSizeZ;
                @display("p=3312.648,2231.784;i=misc/globe");
        }

		//INET
        routingRecorder: RoutingTableRecorder {
            @display("p=4273.416,160.128;is=s");
        }
        //INET
        configurator: IPv4NetworkConfigurator {
            @display("p=4403.52,1190.952");
            config = xmldoc("demo.xml");
        }

        roadsCanvasVisualizer: RoadsCanvasVisualizer {
            @display("p=4553.64,2762.208");
        }

        //# Veins manager module
        veinsManager: VeinsInetManager {
            @display("p=3382.704,230.184;is=s");
        }

        obstacles: ObstacleControl {
            @display("p=4553.64,1841.472");
        }

        annotations: AnnotationManager {
            @display("p=3502.8,1491.192");
        }

        //# NR modules
        //changed
        channelControl: NRChannelControl {
            @display("p=3372.696,750.6;is=s");
        }

        //changed
        binder: NRBinder {
            @display("p=4473.576,710.568;is=s");
        }

        //INET
        server1: StandardHost {
            @display("p=4273.416,3442.752;is=n;i=device/server");
        }
        server2: StandardHost {
            @display("p=3572.856,4563.648;is=n;i=device/server");
        }
        server3: StandardHost {
            @display("p=3863.088,3973.176;is=n;i=device/server");
        }

        //INET
        router: Router {
            @display("p=1781.424,4443.552;i=device/smallrouter");
        }

        upf: UPF {
            @display("p=630.504,4453.56;is=l");
        }

        gNodeB1: gNodeB {
            @display("p=436.092238969096,791.621380800279;is=vl"); // Luceros
        }

        gNodeB2: gNodeB {
            @display("p=859.355020899393,1059.86284739993;is=vl"); // Gabriel Miró
        }

        gNodeB3: gNodeB {
            @display("p=31.5510147169178,1120.28048100001;is=vl"); // Teatro Arniches
        }

        gNodeB4: gNodeB {
            @display("p=746.203731640691,457.422523200876;is=vl"); // Plaza del Mercado
        }

        gNodeB5: gNodeB {
            @display("p=594.91447310333,1510.8057342004;is=vl");  // Paseo Canalejas
        }

        gNodeB6: gNodeB {
            @display("p=1165.47101041388,522.572724000383;is=vl"); // Parque de La Ereta
        }

        gNodeB7: gNodeB {
            @display("p=1420.08777723181,569.832051600315;is=vl"); // Castillo Santa Bárbara
        }

        gNodeB8: gNodeB {
            @display("p=1460.04807360543,1039.8489534;is=vl"); // Playa Postiguet
        }

        gNodeB9: gNodeB {
            @display("p=1304.36343422133,1504.39244219979;is=vl"); // Zona Volvo
        }

    connections allowunconnected:
        server1.pppg++ <--> Eth10G <--> router.pppg++;
        server2.pppg++ <--> Eth10G <--> router.pppg++;
        server3.pppg++ <--> Eth10G <--> router.pppg++;

        router.pppg++ <--> Eth10G <--> upf.filterGate;
        upf.pppg++ <--> Eth10G <--> gNodeB1.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB2.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB3.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB4.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB5.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB6.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB7.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB8.ppp;
        upf.pppg++ <--> Eth10G <--> gNodeB9.ppp;

        //# X2 connections
        gNodeB1.x2++ <--> Eth10G <--> gNodeB2.x2++;//1 0 | 2 0
        gNodeB1.x2++ <--> Eth10G <--> gNodeB3.x2++;//1 1 | 3 0
        gNodeB1.x2++ <--> Eth10G <--> gNodeB4.x2++;//1 2 | 4 0
        gNodeB1.x2++ <--> Eth10G <--> gNodeB5.x2++;//1 3 | 5 0
        gNodeB1.x2++ <--> Eth10G <--> gNodeB6.x2++;//1 4 | 6 0
        gNodeB1.x2++ <--> Eth10G <--> gNodeB7.x2++;//1 5 | 7 0
        gNodeB1.x2++ <--> Eth10G <--> gNodeB8.x2++;//1 6 | 8 0
        gNodeB1.x2++ <--> Eth10G <--> gNodeB9.x2++;//1 7 | 9 0

        gNodeB2.x2++ <--> Eth10G <--> gNodeB3.x2++;//2 1 | 3 1
        gNodeB2.x2++ <--> Eth10G <--> gNodeB4.x2++;//2 2 | 4 1
        gNodeB2.x2++ <--> Eth10G <--> gNodeB5.x2++;//2 3 | 5 1
        gNodeB2.x2++ <--> Eth10G <--> gNodeB6.x2++;//2 4 | 6 1
        gNodeB2.x2++ <--> Eth10G <--> gNodeB7.x2++;//2 5 | 7 1
        gNodeB2.x2++ <--> Eth10G <--> gNodeB8.x2++;//2 6 | 8 1
        gNodeB2.x2++ <--> Eth10G <--> gNodeB9.x2++;//2 7 | 9 1

        gNodeB3.x2++ <--> Eth10G <--> gNodeB4.x2++;//3 2 | 4 2
        gNodeB3.x2++ <--> Eth10G <--> gNodeB5.x2++;//3 3 | 5 2
        gNodeB3.x2++ <--> Eth10G <--> gNodeB6.x2++;//3 4 | 6 2
        gNodeB3.x2++ <--> Eth10G <--> gNodeB7.x2++;//3 5 | 7 2
        gNodeB3.x2++ <--> Eth10G <--> gNodeB8.x2++;//3 6 | 8 2
        gNodeB3.x2++ <--> Eth10G <--> gNodeB9.x2++;//3 7 | 9 2

        gNodeB4.x2++ <--> Eth10G <--> gNodeB5.x2++;//4 3 | 5 3
        gNodeB4.x2++ <--> Eth10G <--> gNodeB6.x2++;//4 4 | 6 3
        gNodeB4.x2++ <--> Eth10G <--> gNodeB7.x2++;//4 5 | 7 3
        gNodeB4.x2++ <--> Eth10G <--> gNodeB8.x2++;//4 6 | 8 3
        gNodeB4.x2++ <--> Eth10G <--> gNodeB9.x2++;//4 7 | 9 3

        gNodeB5.x2++ <--> Eth10G <--> gNodeB6.x2++;//5 4 | 6 4
        gNodeB5.x2++ <--> Eth10G <--> gNodeB7.x2++;//5 5 | 7 4
        gNodeB5.x2++ <--> Eth10G <--> gNodeB8.x2++;//5 6 | 8 4
        gNodeB5.x2++ <--> Eth10G <--> gNodeB9.x2++;//5 7 | 9 4

        gNodeB6.x2++ <--> Eth10G <--> gNodeB7.x2++;//6 5 | 7 5
        gNodeB6.x2++ <--> Eth10G <--> gNodeB8.x2++;//6 6 | 8 5
        gNodeB6.x2++ <--> Eth10G <--> gNodeB9.x2++;//6 7 | 9 5

        gNodeB7.x2++ <--> Eth10G <--> gNodeB8.x2++;//7 6 | 8 6        
        gNodeB7.x2++ <--> Eth10G <--> gNodeB9.x2++;//7 7 | 9 6        

        gNodeB8.x2++ <--> Eth10G <--> gNodeB9.x2++;//8 7 | 9 7        
}
