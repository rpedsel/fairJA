set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8173, <2> 25.247, <3> 10.4312, <4> 27.1939, <5> 28.1163, <6> 17.0437, <7> 21.7841, <8> 24.889, <9> 19.4008, <10> 20.7635, <11> 25.3306, <12> 28.4915, <13> 26.7383, <14> 28.1463, <15> 23.2565, <16> 20.8364, <17> 35.5944, <18> 31.6122, <19> 26.6828, <20> 30.4021;
param workload[JOB] := <1> 5.3682, <2> 5.0246, <3> 3.2297, <4> 5.2148, <5> 5.3025, <6> 4.1284, <7> 4.6673, <8> 4.9889, <9> 4.4046, <10> 4.5567, <11> 5.033, <12> 5.3377, <13> 5.1709, <14> 5.3053, <15> 4.8225, <16> 4.5647, <17> 5.9661, <18> 5.6225, <19> 5.1655, <20> 5.5138;
param capacity[MACHINE] := <1> 99.3877, <2> 99.3877, <3> 99.3877, <4> 99.3877, <5> 99.3877, <6> 99.3877, <7> 99.3877;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
