set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.1847, <2> 31.6879, <3> 37.9197, <4> 32.5293, <5> 45.9057, <6> 46.4453, <7> 29.7785, <8> 0.5973, <9> 6.2991, <10> 23.9146, <11> 35.73, <12> 47.1428, <13> 27.4816, <14> 10.6341, <15> 12.4728, <16> 6.084, <17> 37.9575, <18> 31.2239, <19> 45.7432, <20> 6.3759;
param workload[JOB] := <1> 18.8352, <2> 12.9496, <3> 17.8663, <4> 41.9204, <5> 30.9976, <6> 17.5421, <7> 20.8748, <8> 36.5288, <9> 22.109, <10> 20.01, <11> 24.2901, <12> 45.896, <13> 10.7654, <14> 12.2669, <15> 49.9284, <16> 2.1264, <17> 30.5193, <18> 45.8655, <19> 16.3254, <20> 29.458;
param capacity[MACHINE] := <1> 63.3844, <2> 63.3844, <3> 63.3844, <4> 63.3844, <5> 63.3844, <6> 63.3844;

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
