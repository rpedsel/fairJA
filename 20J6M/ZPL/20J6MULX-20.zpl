set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.0946, <2> 25.9249, <3> 23.3765, <4> 27.6497, <5> 3.9056, <6> 29.4528, <7> 21.5379, <8> 39.899, <9> 35.9827, <10> 2.5859, <11> 12.0379, <12> 4.2524, <13> 12.4863, <14> 17.8273, <15> 33.5536, <16> 14.3647, <17> 0.3194, <18> 16.3638, <19> 20.8874, <20> 0.3751;
param workload[JOB] := <1> 5.8391, <2> 5.0917, <3> 4.8349, <4> 5.2583, <5> 1.9763, <6> 5.427, <7> 4.6409, <8> 6.3166, <9> 5.9986, <10> 1.6081, <11> 3.4696, <12> 2.0621, <13> 3.5336, <14> 4.2222, <15> 5.7925, <16> 3.7901, <17> 0.5652, <18> 4.0452, <19> 4.5703, <20> 0.6125;
param capacity[MACHINE] := <1> 13.2758, <2> 13.2758, <3> 13.2758, <4> 13.2758, <5> 13.2758, <6> 13.2758;

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
