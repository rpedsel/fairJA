set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.2976, <2> 29.1646, <3> 17.134, <4> 18.1754, <5> 21.0675, <6> 22.5141, <7> 26.5074, <8> 15.88, <9> 28.506, <10> 20.9527, <11> 28.6723, <12> 36.8793, <13> 25.6768, <14> 19.1921, <15> 26.4796, <16> 21.5316, <17> 25.8488, <18> 29.3724, <19> 23.9986, <20> 18.1698;
param workload[JOB] := <1> 5.6831, <2> 5.4004, <3> 4.1393, <4> 4.2633, <5> 4.5899, <6> 4.7449, <7> 5.1485, <8> 3.985, <9> 5.3391, <10> 4.5774, <11> 5.3547, <12> 6.0728, <13> 5.0672, <14> 4.3809, <15> 5.1458, <16> 4.6402, <17> 5.0842, <18> 5.4196, <19> 4.8988, <20> 4.2626;
param capacity[MACHINE] := <1> 14.0282, <2> 14.0282, <3> 14.0282, <4> 14.0282, <5> 14.0282, <6> 14.0282, <7> 14.0282;

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
