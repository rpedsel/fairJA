set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.9996, <2> 38.5314, <3> 20.507, <4> 20.0374, <5> 34.0935, <6> 21.6643, <7> 4.3802, <8> 30.0822, <9> 22.9468, <10> 26.561, <11> 38.8371, <12> 11.1528, <13> 38.2798, <14> 3.188, <15> 30.1764, <16> 1.6637, <17> 34.6006, <18> 45.7627, <19> 22.4333, <20> 45.4555;
param workload[JOB] := <1> 45.5484, <2> 8.583, <3> 24.9103, <4> 4.2682, <5> 26.7708, <6> 21.8998, <7> 2.758, <8> 11.5046, <9> 10.4555, <10> 42.2918, <11> 14.1664, <12> 6.5236, <13> 48.864, <14> 6.4784, <15> 27.0733, <16> 49.919, <17> 30.2398, <18> 45.1052, <19> 6.5947, <20> 15.8018;
param capacity[MACHINE] := <1> 56.2195, <2> 56.2195, <3> 56.2195, <4> 56.2195, <5> 56.2195, <6> 56.2195;

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
