set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.9157, <2> 4.5391, <3> 47.737, <4> 38.9702, <5> 20.5326, <6> 26.4446, <7> 5.7217, <8> 12.1013, <9> 13.6446, <10> 41.949, <11> 35.3986, <12> 20.7692, <13> 30.0126, <14> 5.3475, <15> 25.5904, <16> 21.0766, <17> 0.3414, <18> 7.2966, <19> 34.2234, <20> 21.3389;
param workload[JOB] := <1> 31.2848, <2> 41.4618, <3> 17.4595, <4> 4.3073, <5> 30.9784, <6> 13.0479, <7> 28.387, <8> 47.3896, <9> 4.555, <10> 9.4317, <11> 27.0273, <12> 34.3778, <13> 31.2839, <14> 47.0056, <15> 9.7431, <16> 38.7331, <17> 23.2724, <18> 9.407, <19> 0.526, <20> 7.1886;
param capacity[MACHINE] := <1> 456.8678, <2> 456.8678, <3> 456.8678, <4> 456.8678, <5> 456.8678, <6> 456.8678, <7> 456.8678;

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
