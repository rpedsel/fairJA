set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.2709, <2> 15.1514, <3> 21.2971, <4> 2.2, <5> 29.4816, <6> 35.6002, <7> 18.6211, <8> 14.3682, <9> 34.238, <10> 5.2027, <11> 34.9789, <12> 45.3903, <13> 27.092, <14> 30.7512, <15> 23.8752, <16> 3.754, <17> 48.3549, <18> 48.168, <19> 44.7689, <20> 23.6519;
param workload[JOB] := <1> 16.4956, <2> 16.5085, <3> 0.4464, <4> 23.3133, <5> 44.0208, <6> 1.4321, <7> 29.8995, <8> 26.9672, <9> 44.2831, <10> 28.9396, <11> 12.7569, <12> 3.6933, <13> 33.2282, <14> 29.0181, <15> 13.7238, <16> 22.6965, <17> 10.3886, <18> 30.8208, <19> 25.2111, <20> 16.4302;
param capacity[MACHINE] := <1> 430.2736, <2> 430.2736, <3> 430.2736, <4> 430.2736, <5> 430.2736, <6> 430.2736, <7> 430.2736;

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