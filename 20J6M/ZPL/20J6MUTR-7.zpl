set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.1374, <2> 20.87, <3> 47.1076, <4> 35.4923, <5> 31.6004, <6> 13.6709, <7> 46.5505, <8> 43.1726, <9> 2.3432, <10> 4.6814, <11> 24.6384, <12> 27.7411, <13> 2.9224, <14> 12.6022, <15> 47.0169, <16> 31.5909, <17> 29.3621, <18> 27.5257, <19> 10.3371, <20> 42.7603;
param workload[JOB] := <1> 15.2133, <2> 10.74, <3> 17.129, <4> 36.572, <5> 2.7238, <6> 27.264, <7> 39.8313, <8> 13.652, <9> 12.3436, <10> 29.1069, <11> 1.2104, <12> 39.4396, <13> 30.9045, <14> 5.552, <15> 4.9697, <16> 36.753, <17> 3.7825, <18> 14.8664, <19> 24.7595, <20> 18.051;
param capacity[MACHINE] := <1> 48.1081, <2> 48.1081, <3> 48.1081, <4> 48.1081, <5> 48.1081, <6> 48.1081;

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
