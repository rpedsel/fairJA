set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.1772, <2> 27.4612, <3> 29.1742, <4> 22.5499, <5> 17.9606, <6> 27.0564, <7> 25.9803, <8> 31.4386, <9> 32.9926, <10> 36.2389, <11> 21.5553, <12> 34.7811, <13> 24.8676, <14> 29.0499, <15> 19.0265, <16> 17.4528, <17> 24.5904, <18> 30.765, <19> 19.3961, <20> 26.4717;
param workload[JOB] := <1> 5.2132, <2> 5.2403, <3> 5.4013, <4> 4.7487, <5> 4.238, <6> 5.2016, <7> 5.0971, <8> 5.607, <9> 5.7439, <10> 6.0199, <11> 4.6428, <12> 5.8976, <13> 4.9867, <14> 5.3898, <15> 4.3619, <16> 4.1777, <17> 4.9589, <18> 5.5466, <19> 4.4041, <20> 5.1451;
param capacity[MACHINE] := <1> 17.0037, <2> 17.0037, <3> 17.0037, <4> 17.0037, <5> 17.0037, <6> 17.0037;

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
