set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.403, <2> 25.9967, <3> 33.7213, <4> 26.3479, <5> 39.5192, <6> 30.0159, <7> 29.8432, <8> 22.1583, <9> 25.7521, <10> 31.701, <11> 18.7138, <12> 29.2824, <13> 29.0206, <14> 24.9895, <15> 19.938, <16> 28.1015, <17> 23.4956, <18> 24.8657, <19> 22.049, <20> 16.6162;
param workload[JOB] := <1> 5.5139, <2> 5.0987, <3> 5.807, <4> 5.133, <5> 6.2864, <6> 5.4787, <7> 5.4629, <8> 4.7073, <9> 5.0747, <10> 5.6304, <11> 4.3259, <12> 5.4113, <13> 5.3871, <14> 4.9989, <15> 4.4652, <16> 5.3011, <17> 4.8472, <18> 4.9866, <19> 4.6956, <20> 4.0763;
param capacity[MACHINE] := <1> 102.6882, <2> 102.6882, <3> 102.6882, <4> 102.6882, <5> 102.6882, <6> 102.6882, <7> 102.6882;

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
