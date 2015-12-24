set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.1951, <2> 22.4365, <3> 25.6312, <4> 24.4703, <5> 27.2282, <6> 30.6893, <7> 26.7294, <8> 29.5076, <9> 22.5058, <10> 25.0031, <11> 26.7418, <12> 36.0791, <13> 26.8712, <14> 25.1343, <15> 24.091, <16> 30.7691, <17> 12.5875, <18> 25.2363, <19> 34.0391, <20> 22.5108;
param workload[JOB] := <1> 4.7112, <2> 4.7367, <3> 5.0627, <4> 4.9467, <5> 5.2181, <6> 5.5398, <7> 5.17, <8> 5.4321, <9> 4.744, <10> 5.0003, <11> 5.1712, <12> 6.0066, <13> 5.1837, <14> 5.0134, <15> 4.9083, <16> 5.547, <17> 3.5479, <18> 5.0236, <19> 5.8343, <20> 4.7446;
param capacity[MACHINE] := <1> 14.506, <2> 14.506, <3> 14.506, <4> 14.506, <5> 14.506, <6> 14.506, <7> 14.506;

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
