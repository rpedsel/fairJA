set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2429, <2> 25.0127, <3> 30.1075, <4> 28.8779, <5> 29.5061, <6> 25.6889, <7> 21.4622, <8> 29.3928, <9> 23.2281, <10> 16.7461, <11> 25.4743, <12> 27.0267, <13> 33.243, <14> 17.4585, <15> 22.1152, <16> 19.3427, <17> 22.1161, <18> 22.1501, <19> 30.2093, <20> 25.8262;
param workload[JOB] := <1> 2.7858, <2> 3.1159, <3> 15.1727, <4> 16.7657, <5> 2.4298, <6> 12.8386, <7> 27.8186, <8> 29.367, <9> 15.2265, <10> 12.4143, <11> 3.9894, <12> 5.5117, <13> 11.8125, <14> 44.8566, <15> 13.3265, <16> 21.5396, <17> 3.6789, <18> 4.5956, <19> 34.1449, <20> 36.8053;
param capacity[MACHINE] := <1> 39.7745, <2> 39.7745, <3> 39.7745, <4> 39.7745, <5> 39.7745, <6> 39.7745;

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
