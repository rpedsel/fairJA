set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.4955, <2> 35.1683, <3> 24.9148, <4> 22.1381, <5> 26.4674, <6> 20.5178, <7> 27.0864, <8> 22.7164, <9> 26.1675, <10> 12.548, <11> 27.9363, <12> 18.4289, <13> 27.9282, <14> 34.6434, <15> 17.775, <16> 17.7548, <17> 27.9004, <18> 20.7888, <19> 23.6841, <20> 36.0586;
param workload[JOB] := <1> 5.2436, <2> 5.9303, <3> 4.9915, <4> 4.7051, <5> 5.1446, <6> 4.5297, <7> 5.2045, <8> 4.7662, <9> 5.1154, <10> 3.5423, <11> 5.2855, <12> 4.2929, <13> 5.2847, <14> 5.8859, <15> 4.216, <16> 4.2136, <17> 5.2821, <18> 4.5595, <19> 4.8666, <20> 6.0049;
param capacity[MACHINE] := <1> 99.0649, <2> 99.0649, <3> 99.0649, <4> 99.0649, <5> 99.0649, <6> 99.0649;

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
